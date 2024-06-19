//
//  Level1View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct Level1View: View {
    @StateObject var manager = LevelsController()
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
                        ProgressView(value: manager.pointsC)
                            .progressViewStyle(.linear)
                            .frame(width: 200)
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
//                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
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
            manager.start()
        })
        .onDisappear(perform: {
            manager.stop()
        })
        .onChange(of: manager.pointsC >= 1.0){
            showNextLevelView = true
        }
        .fullScreenCover(isPresented: $showNextLevelView) {
                    FinishLevel()
        }
        

            
    }
}

#Preview {
    Level1View(manager: LevelsController())
}
