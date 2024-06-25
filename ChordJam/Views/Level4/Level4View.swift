//
//  Level4View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 25/06/24.
//

import SwiftUI

struct Level4View: View {
    @StateObject var manager = chordModel()
    @State var showNextLevelView = false
    
//    var levelStatus = 2
    
    
    var body: some View {
            
        ZStack{
            Image("BackgroundLevel")
                .resizable()
            
            HStack{
                
                Spacer()
                
                VStack(alignment: .leading){
                    Spacer()
                    VStack{
                        ProgressView(value: manager.pointsDm)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
                        Text("D Minor Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    
                    
                    HStack{
    //                    Spacer()
                        Image("Strings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        //Ganti ke FretDm
                        Image("FretDm")
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
            manager.currentLevel = 4
            manager.startAudioEngine()
        })
        .onChange(of: manager.pointsDm >= 1.0){
//            manager.currentLevel = 5
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
    Level4View()
}
