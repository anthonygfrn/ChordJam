//import SwiftUI
//
//struct Level2View: View {
//    @Binding var unlockedLevel: Int
//    @Environment(\.presentationMode) var presentationMode
//    @State private var isLevelCompleted = false
//    
//    var body: some View {
//        VStack {
//            Text("Level 2")
//                .font(.largeTitle)
//                .padding()
//            
//            Button(action: {
//                isLevelCompleted = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                    unlockedLevel = 3
//                    presentationMode.wrappedValue.dismiss()
//                }
//            }) {
//                Text("Complete Level 2")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//    }
//}
//
//#Preview {
//    Level2View(unlockedLevel: .constant(2))
//}


//
//  Level1View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct Level2View: View {
    @StateObject var manager = chordModel()
    @Binding var unlockedLevel: Int
    @State var showNextLevelView = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isLevelCompleted = false

    var body: some View {
        ZStack {
            Image("BackgroundLevel")
                .resizable()
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    VStack {
                        ProgressView(value: manager.pointsAm)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
                        
                        Text("A Minor Chord")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.yellow)
                    }
                    
                    HStack {
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
        }
        .ignoresSafeArea()
        .onAppear {
            manager.currentLevel = 2
            manager.startAudioEngine()
        }
        .onChange(of: manager.pointsAm >= 1.0) { _ in
            UserDefaults.standard.set(manager.currentLevel, forKey: "LevelSekarang")
            manager.audioEngine.stop()
            showNextLevelView = true
            unlockedLevel = 3
            print(unlockedLevel)// Unlock the next level (G chord)
        }
        .fullScreenCover(isPresented: $showNextLevelView) {
            FinishLevel(unlockedLevel: $unlockedLevel)
        }
    }
}

#Preview {
    Level2View(unlockedLevel: .constant(2))
}
