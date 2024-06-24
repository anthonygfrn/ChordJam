//
//  ProfileView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI
import GameKit

struct ProfileView: View {
    @EnvironmentObject var gameCenterManager: GameCenterManager

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()
           
            if gameCenterManager.isAuthenticated {
                if let playerAlias = gameCenterManager.playerAlias {
                    Text("Welcome, \(playerAlias)") // Display player's alias
                        .font(.headline)
                        .padding()
                }
            } else {
                Button("Sign in to Game Center") {
                    gameCenterManager.authenticatePlayer()
                }
                .padding()
            }
            
            VStack {
                Spacer()
                NavBar()
            }
            .padding(.bottom, -30)
        }
    }
}

#Preview {
    ProfileView()
}
