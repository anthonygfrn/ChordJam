//
//  LeaderboardView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

struct LeaderboardView: View {
    
    var body: some View {
        Text("Leaderboard")
            .font(.largeTitle)
            .padding()
        
        VStack {
            Spacer()
            NavBar()
        }
        .padding(.bottom, -30)
    }
}

#Preview {
    LeaderboardView()
}
