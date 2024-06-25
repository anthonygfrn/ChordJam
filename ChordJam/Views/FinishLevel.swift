//
//  FinishLevel.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct FinishLevel: View {
//    var data = 1
    @StateObject var manager = chordModel()
    @State private var path = NavigationPath()
    @State private var showNextLevelView = false
    
    var body: some View {
//        var nextLevel = manager.nextLevel
        
        NavigationStack{
            ZStack{
                Image("BackgroundLevel")
                    .resizable()
                
                VStack(spacing: 30.0){
                    
                    VStack(spacing: 20.0){
                        Text("Congratulations!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.white)
                        
                        Image("Coin+Exp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 326, height: 35)
                    }
                    
                    HStack(spacing: 100.0){
                        Button(action: {}, label: {
                            Image("RetryButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 51, height: 95)
                        })
                        
        //                Spacer()
                        
                        
                
                        Button(action: {
//                            manager.checkNextLevel()
                            showNextLevelView = manager.currentLevel > 0
                            
                        }, label: {
                            Image("ContinueButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 86,height: 94)
                        })
                    }
                    .padding()
                    NavigationLink(destination: nextDestinationView, isActive: $showNextLevelView) {
                        EmptyView()
                    }
                    .navigationBarBackButtonHidden(true)
                }
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

@ViewBuilder
private var nextDestinationView: some View {
    let manager = chordModel()
//    Text(manager.currentLevel)
      switch manager.currentLevel {
          
      case 1:
//          print()
          //sukses
          CombinedLevels2View()
              .environmentObject(manager)
          
      case 2:
          //prob
          CombinedLevels3View()
              .environmentObject(manager)
          
      case 3:
          CombinedLevels4View()
              .environmentObject(manager)
      case 4:
          CombinedLevels4View()
              .environmentObject(manager)
      default:
          Text("CUAKKKKK")
          EmptyView()
      }
  }

#Preview {
    FinishLevel()
}
