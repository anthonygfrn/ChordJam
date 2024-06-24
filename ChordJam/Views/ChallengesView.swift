//
//  ChallengesView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

import SwiftUI

struct ChallengesView: View {
    
    var body: some View {
        VStack {
            Text("Challenges")
                .font(.largeTitle)
                .padding()
            
            VStack {
                Spacer()
                NavBar()
            }
            .padding(.bottom, -30)
        }
        
    }
}


#Preview {
    ChallengesView()
}
