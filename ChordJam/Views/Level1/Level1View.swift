//
//  Level1View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct Level1View: View{
    
//    @State private var predictionResult:String  = ""
//    @State private var confidence:Double  = 0.0
    
//    @ObservedObject var observerManager = ResultsObserver()
    @StateObject var manager = chordModel()
    @State var showNextLevelView = false
    
    var levelStatus = 1
    
//    private var text : String = ""
    
    var body: some View {
            
        ZStack{
            Image("BackgroundLevel")
                .resizable()
            
            HStack{
                
                Spacer()
                
                VStack(alignment: .leading){
                    Spacer()
                    VStack{
                        ProgressView(value: manager.pointsC)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
                        
//                        Text("Points: \(String(describing: manager.pointsC))")
                        Text("C Major Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    
                    
                    HStack{
    //                    Spacer()
                        Image("Strings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("FretC")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 700)
                    }
                    .frame(height: 190)

                    Spacer()
                }
                
            }
//            Button(action: {
//                showNextLevelView = true
//            }, label: {
//                Text("Button")
//            })
            
            
            Image("Fingering")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 123)
                .offset(x: 350, y: 100)
            
//            Text("\(manager.pointsC)")
            
        }
        .ignoresSafeArea()
        .onAppear(perform: {
//            manager.start()
//            ResultsObserver().delegate = self
            manager.currentLevel = 1
            manager.startAudioEngine()
//            text = String(observerManager.pointsC)
        })
        .onChange(of: manager.pointsC >= 1.0){
//            manager.currentLevel = 2
            manager.audioEngine.stop()
            showNextLevelView = true
        }
        .fullScreenCover(isPresented: $showNextLevelView) {
            
                    FinishLevel()
        }
//        .onReceive(manager.$pointsC, perform: { _ in
//            print("called")
//        })
        

            
    }
    
//    func displayPredictionResult(identifier: String, confidence: Double) {
//        DispatchQueue.main.async {
//            self.predictionResult = identifier
//            print(self.predictionResult)
//            self.confidence = confidence
//        }
//    }
}

#Preview {
    Level1View()
}
