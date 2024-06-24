//
//  LeaderboardView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI
import GameKit

struct LeaderboardView: View {
    @EnvironmentObject var gameCenterManager: GameCenterManager

    var body: some View {
        VStack {
        }
        .onAppear {
            gameCenterManager.showLeaderboard() // Show the leaderboard immediately when the view appears
        }
    }
}

#Preview {
    LeaderboardView()
}
