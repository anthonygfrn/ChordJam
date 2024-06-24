//
//  ContentView.swift
//  ChordJam
//
//  Created by Anthony on 14/06/24.
//

import SwiftUI

struct ContentView: View {
  @State private var currentView = "Home"

  var body: some View {
    ZStack {
      if currentView == "Home" {
        MainMenuView()
      } else if currentView == "Challenges" {
        ChallengesView()
      } else if currentView == "Leaderboard" {
        LeaderboardView()
      } else if currentView == "Collection" {
        CollectionView()
      } else if currentView == "Profile" {
        ProfileView()
      }

      VStack {
        Spacer()
        NavBar(currentView: $currentView)
      }
      .padding(.bottom, -30)
    }
  }
}

#Preview {
    ContentView()
}
