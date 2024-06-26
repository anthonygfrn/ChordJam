//
//  Level1View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct Level1View: View {
    @StateObject var manager = chordModel()
    @Binding var unlockedLevel: Int
    @State var showNextLevelView = false
    
    var body: some View {
        ZStack{
            Image("BackgroundLevel")
                .resizable()
            
            HStack{
                Spacer()
                VStack(alignment: .leading){
                    Spacer()
                    VStack{
                        ProgressBar(progress: manager.pointsAm, total: 90)
                        
                        Text("C Major Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    HStack{
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
            
            Image("Fingering")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 123)
                .offset(x: 350, y: 100)
        }
        .ignoresSafeArea()
        .onAppear {
            manager.currentLevel = 1
            manager.startAudioEngine()
        }
        .onChange(of: manager.pointsAm >= 90.0) { _ in
            UserDefaults.standard.set(manager.currentLevel, forKey: "LevelSekarang")
            manager.audioEngine.stop()
            showNextLevelView = true
            if(unlockedLevel >= 2) {
                print("not updating level")
                return
            } else {
                print(" updating level")
                unlockedLevel = 2 // Unlock the next level
            }
            
        }
        .fullScreenCover(isPresented: $showNextLevelView) {
            FinishLevel(unlockedLevel: $unlockedLevel)
        }
    }
}

#Preview {
    Level1View(unlockedLevel: .constant(1))
}
