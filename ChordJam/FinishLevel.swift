//
//  FinishLevel.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct FinishLevel: View {
    var body: some View {
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
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("RetryButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 51, height: 95)
                    })
                    
    //                Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("ContinueButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 86,height: 94)
                    })
                }
                .padding()
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FinishLevel()
}
