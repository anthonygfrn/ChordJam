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
    @Binding var currentView: String
    
    var body: some View {
        HStack(spacing: 48) {
            NavBarItem(currentView: $currentView, viewName: "Home", imageName: "home")
            NavBarItem(currentView: $currentView, viewName: "Challenges", imageName: "challenges")
            NavBarItem(currentView: $currentView, viewName: "Leaderboard", imageName: "leaderboard")
            NavBarItem(currentView: $currentView, viewName: "Collection", imageName: "collection")
            NavBarItem(currentView: $currentView, viewName: "Profile", imageName: "profile")
        }
        .padding(15)
        .background(Color(UIColor(red: 194/255, green: 194/255, blue: 194/255, alpha: 1)))
        .cornerRadius(20)
        .padding(.bottom, 30)
        .opacity(0.97)
    }
}

struct NavBarItem: View {
    @Binding var currentView: String
    let viewName: String
    let imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .renderingMode(.template)
                .foregroundColor(currentView == viewName ? .white : Color(hex: 0x686868))

            Text(viewName)
                .font(.footnote)
                .foregroundColor(currentView == viewName ? .white : Color(hex: 0x686868))
        }
        .onTapGesture {
            currentView = viewName
        }
    }
}
