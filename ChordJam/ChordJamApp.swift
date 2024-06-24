//
//  ChordJamApp.swift
//  ChordJam
//
//  Created by Anthony on 14/06/24.
//

import SwiftUI

@main
struct ChordJamApp: App {
    
    @StateObject private var gameCenterManager = GameCenterManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(gameCenterManager)
            }
        }
    }
}
