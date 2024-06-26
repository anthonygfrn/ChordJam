//
//  ContentView.swift
//  ChordJam
//
//  Created by Anthony on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView = "Introduction"
    @State private var unlockedLevel = 1

    var body: some View {
        ZStack {
            if currentView == "Introduction" {
                Introduction(onFinish: {
                    withAnimation {
                        currentView = "MainMenu"
                    }
                })
            } else if currentView == "MainMenu" {
                MainMenuView(unlockedLevel: $unlockedLevel)
            }
        }
    }
}

#Preview {
    ContentView()
}
