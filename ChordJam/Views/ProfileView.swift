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
    @State private var playerAvatar: Image?
    @State private var streakDays: Int = UserDefaults.standard.integer(forKey: "streakDays")
    @State private var lastOpenDate: Date? = UserDefaults.standard.object(forKey: "lastOpenDate") as? Date

    var body: some View {
        VStack {
            if gameCenterManager.isAuthenticated {
                HStack {
                    if let playerAvatar = playerAvatar {
                        playerAvatar
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        if let alias = gameCenterManager.playerAlias {
                            Text("Welcome, \(alias)")
                                .font(.headline)
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("Streak Days: \(streakDays)")
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }
                .padding()
            } else {
                Text("Not signed in to Game Center")
                    .padding()
            }
        }
        .onAppear {
            incrementStreakDays()
            GKLocalPlayer.local.loadPhoto(for: .normal) { image, error in
                if let image = image {
                    self.playerAvatar = Image(uiImage: image)
                }
            }
        }
    }

    private func incrementStreakDays() {
        let today = Calendar.current.startOfDay(for: Date())
        if let lastOpen = lastOpenDate, lastOpen == today {
            // Already opened today, do nothing
            return
        } else if let lastOpen = lastOpenDate, Calendar.current.isDateInYesterday(lastOpen) {
            // Opened yesterday, increment streak
            streakDays += 1
        } else {
            // Opened after more than a day, reset streak
            streakDays = 1
        }
        lastOpenDate = today
        UserDefaults.standard.set(streakDays, forKey: "streakDays")
        UserDefaults.standard.set(lastOpenDate, forKey: "lastOpenDate")
    }
}

#Preview {
    ProfileView().environmentObject(GameCenterManager.shared)
}
