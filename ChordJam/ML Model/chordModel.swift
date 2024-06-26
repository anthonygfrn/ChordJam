//
//  chordModel.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 23/06/24.
//

import Foundation
import CoreML
import AVKit
import SoundAnalysis

class chordModel: NSObject, ObservableObject, SNResultsObserving {
    
    @Published var predictionResult: String = ""
    @Published var classifiedConfidence: Double = 0.0
    
    @Published var pointsC : Double = 0.0
    @Published var pointsAm : Double = 0.0
    @Published var pointsDm : Double = 0.0
    @Published var pointsG : Double = 0.0
    
    @Published var nextLevel = 2
    
    @Published var currentLevel : Int = 0
    
    //    var status1 = Level1View().levelStatus
    //    var status2 = Level2View().levelStatus
    //    var status3 = Level3View().levelStatus
    
    
    let audioEngine = AVAudioEngine()
    private var chordClassifierModel = try! ChordDetection(configuration: .init())
    var inputFormat: AVAudioFormat!
    var analyzer: SNAudioStreamAnalyzer!
    
    let analysisQueue = DispatchQueue(label: "com.apple.AnalysisQueue")
    
    
    func setupAudioSession() {
           do {
               let audioSession = AVAudioSession.sharedInstance()
               // Set the category to play and record with options to allow Bluetooth and default to speaker
               try audioSession.setCategory(.playAndRecord, mode: .default, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker])
               try audioSession.setActive(true)
               
               // Override output to force audio to headphones if available
               if let availableInputs = audioSession.availableInputs {
                   for input in availableInputs {
                       if input.portType == .headsetMic || input.portType == .bluetoothA2DP {
                           try audioSession.setPreferredInput(input)
                           break
                       }
                   }
               }
           } catch {
               print("Failed to set up audio session: \(error.localizedDescription)")
           }
       }
    
    func startAudioEngine(){
        setupAudioSession()
        
        inputFormat = audioEngine.inputNode.inputFormat(forBus: 0)
        analyzer = SNAudioStreamAnalyzer(format: inputFormat)
        
        //        print("masuk audio engine")
        
        do{
            
            let request = try SNClassifySoundRequest(mlModel: chordClassifierModel.model)
            
            print(request)
            
            try analyzer.add(request, withObserver: self)
            
        }catch{
            print("unable to prepare req: \(error.localizedDescription)")
            return
        }
        
        
        
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 8000, format: inputFormat) { buffer, time in
            self.analysisQueue.async {
                self.analyzer.analyze(buffer, atAudioFramePosition: time.sampleTime)
            }
        }
        
        
        do{
            try audioEngine.start()
            
        }catch( _){
            print("error starting audio engine")
        }
        
    }
    
    func displayPredictionResult(identifier: String, confidence: Double) {
        DispatchQueue.main.async {
            self.predictionResult = identifier
            //            print(self.predictionResult)
            self.classifiedConfidence = confidence
        }
    }
    
    func request(_ request: any SNRequest, didProduce result: any SNResult) {
        guard let result = result as? SNClassificationResult,
              let classification = result.classifications.first else {return}
        
        let confidence = classification.confidence * 100.0
        
        if confidence > 60{
            //            delegate?.displayPredictionResult(identifier: classification.identifier, confidence: confidence)
            DispatchQueue.main.async{
                self.predictionResult = classification.identifier
                self.classifiedConfidence = confidence
            }
            
            //            predictionResult = classification.identifier
            //            classifiedConfidence = confidence
            print("Pred: \(predictionResult) -- Confidence: \(confidence)")
            //            print(classifiedConfidence)
            
            
            if currentLevel == 1 {
                //                print("ini level 1")
                if predictionResult == "C"{
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        self.pointsC += 0.34
                        self.pointsAm = 0
                        self.pointsDm = 0
                        self.pointsG = 0
                        
                        
                    }
                    //                updatePoints(points: pointsC)
                    print(pointsC)
                    
                    if pointsC >= 1.0{
                        //                    print("Lanjut Om!")
                        pointsAm = 0
                        pointsDm = 0
                        pointsG = 0
                        nextLevel = 2
                        
                        //                        DispatchQueue.main.async{
                        //                            self.objectWillChange.send()
                        //                            self.currentLevel = 1
                        //                        }
                        return
                    }
                }
            }else if currentLevel == 2{
                //                print("ini level 2")
                if predictionResult == "Am"{
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        self.pointsAm += 0.34
                        self.pointsC = 0
                        self.pointsDm = 0
                        self.pointsG = 0
                    }
                    //                updatePoints(points: pointsC)
                    print(pointsAm)
                    
                    if pointsAm >= 1.0{
                        //                    print("Lanjut Om!")
                        pointsC = 0
                        pointsDm = 0
                        pointsG = 0
                        nextLevel = 3
                        
                        //                        DispatchQueue.main.async{
                        //                            self.objectWillChange.send()
                        //                            self.currentLevel = 2
                        //                        }
                        
                        return
                    }
                }
            }
            else if currentLevel == 3 {
                //                print("ini level 3")
                
                //Ganti nnti
                if predictionResult == "G"{
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        self.pointsG += 0.34
                        self.pointsC = 0
                        self.pointsDm = 0
                        self.pointsAm = 0
                    }
                    //                updatePoints(points: pointsC)
                    print(pointsG)
                    
                    if pointsG >= 1.0{
                        //                    print("Lanjut Om!")
                        pointsC = 0
                        pointsDm = 0
                        pointsAm = 0
                        nextLevel = 3
                        
                        //                        DispatchQueue.main.async{
                        //                            self.objectWillChange.send()
                        //                            self.currentLevel = 3
                        //                        }
                        return
                    }
                }
            }
            else if currentLevel == 4 {
                //                print("ini level 3")
                if predictionResult == "Dm"{
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        self.pointsDm += 0.34
                        self.pointsC = 0
                        self.pointsAm = 0
                        self.pointsG = 0
                    }
                    //                updatePoints(points: pointsC)
                    print(pointsDm)
                    
                    if pointsDm >= 1.0{
                        //                    print("Lanjut Om!")
                        pointsC = 0
                        pointsAm = 0
                        pointsG = 0
                        nextLevel = 5
                        
                        //                        DispatchQueue.main.async{
                        //                            self.objectWillChange.send()
                        //                            self.currentLevel = 4
                        //                        }
                        return
                    }
                }
            }
            else if currentLevel == 6 {
                //                print("ini level 3")
                if predictionResult == "Dm"{
                    DispatchQueue.main.async {
                        self.objectWillChange.send()
                        self.pointsDm += 0.34
                        self.pointsC = 0
                        self.pointsAm = 0
                        self.pointsG = 0
                    }
                    //                updatePoints(points: pointsC)
                    print(pointsDm)
                    
                    if pointsDm >= 1.0{
                        //                    print("Lanjut Om!")
                        pointsC = 0
                        pointsAm = 0
                        pointsG = 0
                        nextLevel = 5
                        
                        //                        DispatchQueue.main.async{
                        //                            self.objectWillChange.send()
                        //                            self.currentLevel = 4
                        //                        }
                        return
                    }
                }
            }
            
            
            
            
            
        }
    }
    
    
    
}
