//
//  Level3View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 24/06/24.
//

import SwiftUI

struct Level3View: View {
    @StateObject var manager = chordModel()
    @State var showNextLevelView = false
    
    var levelStatus = 3
    
    
    var body: some View {
            
        ZStack{
            Image("BackgroundLevel")
                .resizable()
            
            HStack{
                
                Spacer()
                
                VStack(alignment: .leading){
                    Spacer()
                    VStack{
                        ProgressView(value: manager.pointsG)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
                        Text("G Major Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    
                    
                    HStack{
    //                    Spacer()
                        Image("Strings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("FretG")
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
            manager.currentLevel = 3
            manager.startAudioEngine()
        })
        .onChange(of: manager.pointsG >= 1.0){
//            manager.currentLevel = 4
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
    Level3View()
}
