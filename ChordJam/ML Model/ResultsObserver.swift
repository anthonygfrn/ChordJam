//
//  ResultsObserver.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 24/06/24.
//

import Foundation
import SoundAnalysis

class ResultsObserver: NSObject, SNResultsObserving, ObservableObject{
    @Published var classifiedChords : String = ""
    @Published var classifiedConfidence : Double = 0.00
    var delegate: chordModelDelegate?
    
    @Published var pointsC = 0.0{
        didSet {
            print(pointsC)
        }
    }
    
    
    func request(_ request: any SNRequest, didProduce result: any SNResult) {
        guard let result = result as? SNClassificationResult,
              let classification = result.classifications.first else {return}
        
        let confidence = classification.confidence * 100.0
        
        if confidence > 60{
            delegate?.displayPredictionResult(identifier: classification.identifier, confidence: confidence)
            
            classifiedChords = classification.identifier
            classifiedConfidence = confidence
            print(classifiedChords)
            //            print(classifiedConfidence)
            
            if classifiedChords == "Ambient Noise"{
                print("masuk C")
                pointsC = 2
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                    self.pointsC = 2.0
                }
//                updatePoints(points: pointsC)
                print(pointsC)
                
                if pointsC >= 1.0{
                    print("Lanjut Om!")
                    return
                }
                
                
            }
            
            
        }
    }
    
    
//    @Published var temp: Double = 0.0
//
//        func updatePoints(points: Double) -> Double?{
//            temp = points
//            return temp
//        }
    
    
    
    
    
}

protocol chordModelDelegate {
    func displayPredictionResult(identifier: String, confidence: Double)
}
