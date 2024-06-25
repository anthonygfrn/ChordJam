//
//  Level1View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct Level2View: View {
    @StateObject var manager = chordModel()
    @State var showNextLevelView = false
    
    var levelStatus = 2
    
    
    var body: some View {
            
        ZStack{
            Image("BackgroundLevel")
                .resizable()
            
            HStack{
                
                Spacer()
                
                VStack(alignment: .leading){
                    Spacer()
                    VStack{
                        ProgressView(value: manager.pointsAm)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
                        Text("A Minor Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    
                    
                    HStack{
    //                    Spacer()
                        Image("Strings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("FretAm")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 700)
                    }
                    .frame(height: 190)

                    Spacer()
                }
                
            }
            
            
            Image("Fingering")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 123)
                .offset(x: 350, y: 100)
            
//            Text("\(manager.pointsC)")
            
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            manager.currentLevel = 2
            manager.startAudioEngine()
        })
        .onChange(of: manager.pointsAm >= 1.0){
//            manager.currentLevel = 3
            manager.audioEngine.stop()
            showNextLevelView = true
        }
        .fullScreenCover(isPresented: $showNextLevelView) {
                    FinishLevel()
        }
        .navigationBarBackButtonHidden(true)
        

            
    }
}

#Preview {
    Level2View()
}
