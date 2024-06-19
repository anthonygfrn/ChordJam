//
//  LevelController.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import Foundation
import AudioKit
import AudioKitEX
import AudioKitUI
import AudioToolbox
import SoundpipeAudioKit
import Tonic


class LevelsController: ObservableObject, HasAudioEngine{
    @Published var data = TuningData()
    @Published var pointsC = 0.0
    @Published var pointsD = 0.0
    @Published var pointsG = 0.0
    @Published var pointsEm = 0.0
    
    let engine = AudioEngine()
    let initialDevice: Device
    
    let mic: AudioEngine.InputNode
    let tappableNodeA: Fader
    let tappableNodeB: Fader
    let tappableNodeC: Fader
    let silence: Fader
    
    var tracker: PitchTap!
    
    let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
    let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
    
    
    
    init() {
        guard let input = engine.input else { fatalError() }
        
        guard let device = engine.inputDevice else { fatalError() }
        
        initialDevice = device
        
        mic = input
        tappableNodeA = Fader(mic)
        tappableNodeB = Fader(tappableNodeA)
        tappableNodeC = Fader(tappableNodeB)
        silence = Fader(tappableNodeC, gain: 0)
        engine.output = silence
        
        tracker = PitchTap(mic) { pitch, amp in
            DispatchQueue.main.async {
                self.update(pitch[0], amp[0])
            }
        }
        tracker.start()
    }
    
    func update(_ pitch: AUValue, _ amp: AUValue) {
        // Reduces sensitivity to background noise to prevent random / fluctuating data.
        guard amp > 0.1 else { return }
        
        data.pitch = pitch
        data.amplitude = amp
        
        var frequency = pitch
        while frequency > Float(noteFrequencies[noteFrequencies.count - 1]) {
            frequency /= 2.0
        }
        while frequency < Float(noteFrequencies[0]) {
            frequency *= 2.0
        }
        
        var minDistance: Float = 10000.0
        var index = 0
        
        for possibleIndex in 0 ..< noteFrequencies.count {
            let distance = fabsf(Float(noteFrequencies[possibleIndex]) - frequency)
            if distance < minDistance {
                index = possibleIndex
                minDistance = distance
            }
        }
        let octave = Int(log2f(pitch / frequency))
        data.noteNameWithSharps = "\(noteNamesWithSharps[index])\(octave)"
        data.noteNameWithFlats = "\(noteNamesWithFlats[index])\(octave)"
        
//        print("Points: \(points)")
        print(data.noteNameWithSharps)
        if data.noteNameWithSharps == "C2"{
            
            pointsC+=0.34
            print(pointsC)
            
            if pointsC >= 1.0 {
                print("successfully played the C chord!")
//                pointsC = 0
//                pointsEm = 0
//                pointsG = 0
//                pointsD = 0

            }
            
        }
//        Tonic.cho
    }
}
