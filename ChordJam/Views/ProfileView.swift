//
//  ProfileView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

import SwiftUI
import GameKit

struct ProfileView: View {
    @EnvironmentObject var gameCenterManager: GameCenterManager
    @State private var playerAvatar: Image? // State to hold the avatar image

    var body: some View {
        VStack {
            if gameCenterManager.isAuthenticated {
                VStack {
                    if let alias = gameCenterManager.playerAlias {
                        Text("Welcome, \(alias)")
                            .font(.headline)
                    }

                    playerAvatar?  // Display the avatar if it's loaded
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                .padding()
            } else {
                Text("Not signed in to Game Center")
                    .padding()
            }
        }
        .onAppear { // Load the avatar when the view appears
            GKLocalPlayer.local.loadPhoto(for: .normal) { image, error in
                if let image = image {
                    self.playerAvatar = Image(uiImage: image)
                }
            }
        }
    }
}


#Preview {
    ProfileView()
}
