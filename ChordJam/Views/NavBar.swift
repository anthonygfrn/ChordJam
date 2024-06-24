//
//  NavBar.swift
//  ChordJam
//
//  Created by Anthony on 19/06/24.
//

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack(spacing: 48) {
            NavigationLink(destination: MainMenuView()) {
                NavBarItem(viewName: "Home", imageName: "home", isActive: true)
            }
            NavigationLink(destination: ChallengesView()) {
                NavBarItem(viewName: "Challenges", imageName: "challenges")
            }
            NavigationLink(destination: LeaderboardView()) {
                NavBarItem(viewName: "Leaderboard", imageName: "leaderboard")
            }
            NavigationLink(destination: CollectionView()) {
                NavBarItem(viewName: "Collection", imageName: "collection")
            }
            NavigationLink(destination: ProfileView()) {
                NavBarItem(viewName: "Profile", imageName: "profile")
            }
        }
        .padding(15)
        .background(Color(UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1)))
        .cornerRadius(20)
        .padding(.bottom, 30)
        .opacity(0.97)
    }
}

struct NavBarItem: View {
    let viewName: String
    let imageName: String
    var isActive: Bool = false // Added isActive to determine color

    var body: some View {
        VStack {
            Image(imageName)
                .renderingMode(.template)
                .foregroundColor(isActive ? .white : Color(hex: 0x686868))
            Text(viewName)
                .font(.footnote)
                .foregroundColor(isActive ? .white : Color(hex: 0x686868))
        }
    }
}
