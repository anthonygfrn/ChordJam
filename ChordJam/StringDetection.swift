//
//  StringDetection.swift
//  ChordJam
//
//  Created by Ferdinand Jacques on 21/06/24.
//

import Foundation
import AVFoundation
import Accelerate

struct GuitarStrings {
    static let frequencies: [String: Double] = [
        "E2": 82.41,
        "A2": 110.00,
        "D3": 146.83,
        "G3": 196.00,
        "B3": 246.94,
        "E4": 329.63
    ]
}

class GuitarStringDetector: NSObject, AVAudioRecorderDelegate {
    var audioEngine: AVAudioEngine!
    var inputNode: AVAudioInputNode!
    var bufferSize: AVAudioFrameCount = 4096
    var sampleRate: Double = 44100.0
    var detectionHandler: ((String) -> Void)?
    var frequencyBuffer: [Double] = []
    let bufferMaxCount = 5
    let noiseThreshold: Float = 0.02
    let minimumFrequency = 80.0
    let maximumFrequency = 350.0

    override init() {
        super.init()
        setupAudioEngine()
    }

    func setupAudioEngine() {
        audioEngine = AVAudioEngine()
        inputNode = audioEngine.inputNode

        let format = inputNode.inputFormat(forBus: 0)
        sampleRate = format.sampleRate

        inputNode.installTap(onBus: 0, bufferSize: bufferSize, format: format) { (buffer, time) in
            self.processBuffer(buffer: buffer)
        }

        do {
            try audioEngine.start()
        } catch {
            print("Audio Engine start error: \(error.localizedDescription)")
        }
    }

    func stopDetection() {
        audioEngine.stop()
        inputNode.removeTap(onBus: 0)
        frequencyBuffer.removeAll()
        detectionHandler = nil
    }

    func processBuffer(buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData?[0] else { return }
        let channelDataArray = Array(UnsafeBufferPointer(start: channelData, count: Int(buffer.frameLength)))

        var windowedData = [Float](repeating: 0.0, count: channelDataArray.count)
        vDSP_hann_window(&windowedData, vDSP_Length(channelDataArray.count), Int32(vDSP_HANN_NORM))
        vDSP_vmul(channelDataArray, 1, windowedData, 1, &windowedData, 1, vDSP_Length(channelDataArray.count))

        var fftMagnitudes = [Float](repeating: 0.0, count: channelDataArray.count / 2)
        performFFT(windowedData: windowedData, magnitudes: &fftMagnitudes)

        if let frequency = detectFrequency(magnitudes: fftMagnitudes) {
            frequencyBuffer.append(frequency)
            if frequencyBuffer.count > bufferMaxCount {
                frequencyBuffer.removeFirst()
            }

            let smoothedFrequency = medianFilter(frequencyBuffer)

            if let string = detectString(frequency: smoothedFrequency) {
//                print("Detected string: \(string) with frequency: \(smoothedFrequency) Hz")
                detectionHandler?(string)
            }
        }
    }

    func performFFT(windowedData: [Float], magnitudes: inout [Float]) {
        let log2n = vDSP_Length(log2(Float(windowedData.count)))
        let fftSetup = vDSP_create_fftsetup(log2n, Int32(kFFTRadix2))
        var realp = [Float](repeating: 0.0, count: windowedData.count / 2)
        var imagp = [Float](repeating: 0.0, count: windowedData.count / 2)
        var output = DSPSplitComplex(realp: &realp, imagp: &imagp)

        windowedData.withUnsafeBufferPointer { (pointer) in
            pointer.baseAddress!.withMemoryRebound(to: DSPComplex.self, capacity: windowedData.count) { (complexPointer) in
                vDSP_ctoz(complexPointer, 2, &output, 1, vDSP_Length(windowedData.count / 2))
            }
        }

        vDSP_fft_zrip(fftSetup!, &output, 1, log2n, Int32(FFT_FORWARD))
        vDSP_zvabs(&output, 1, &magnitudes, 1, vDSP_Length(windowedData.count / 2))

        vDSP_destroy_fftsetup(fftSetup)
    }

    func detectFrequency(magnitudes: [Float]) -> Double? {
        let maxIndex = magnitudes.firstIndex(of: magnitudes.max()!)!
        let frequency = Double(maxIndex) * sampleRate / Double(magnitudes.count * 2)

        if magnitudes[maxIndex] < noiseThreshold || frequency < minimumFrequency || frequency > maximumFrequency {
            return nil
        }

        return frequency
    }

    func detectString(frequency: Double) -> String? {
        let sortedStrings = GuitarStrings.frequencies.sorted { abs($0.value - frequency) < abs($1.value - frequency) }
        if let closest = sortedStrings.first {
            let tolerance = 5.0 // Tolerance of 5 Hz
            if abs(closest.value - frequency) < tolerance {
                return closest.key
            }
        }
        return nil
    }

    func startDetection(handler: @escaping (String) -> Void) {
        self.detectionHandler = handler
    }

    func medianFilter(_ data: [Double]) -> Double {
        let sorted = data.sorted()
        if sorted.count % 2 == 0 {
            return (sorted[sorted.count / 2 - 1] + sorted[sorted.count / 2]) / 2
        } else {
            return sorted[sorted.count / 2]
        }
    }
}
