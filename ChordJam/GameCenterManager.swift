//
//  GameCenterManager.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import Foundation
import GameKit

class GameCenterManager: NSObject, ObservableObject {
    
    static let shared = GameCenterManager()
    
    @Published var isAuthenticated = false
    @Published var playerAlias: String?
    
    let leaderboardID = "chordjam_leaderboard" // Your leaderboard ID
    
    private override init() {
        super.init()
        authenticatePlayer()
    }
    
    func authenticatePlayer() {
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            if let viewController = viewController {
                // Present the view controller so the player can sign in to Game Center
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    windowScene.windows.first?.rootViewController?.present(viewController, animated: true)
                }
            } else if GKLocalPlayer.local.isAuthenticated {
                // Player is authenticated
                self.isAuthenticated = true
                self.playerAlias = GKLocalPlayer.local.alias
                print("Player authenticated: \(GKLocalPlayer.local.alias)")
            } else {
                // Authentication failed
                self.isAuthenticated = false
                if let error = error {
                    print("Game Center authentication failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func showLeaderboard() {
        let viewController = GKGameCenterViewController(state: .leaderboards)
        viewController.gameCenterDelegate = self
        viewController.leaderboardIdentifier = leaderboardID // Set the leaderboard ID
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first?.rootViewController?.present(viewController, animated: true)
        }
    }
    
    func reportScore(score: Int64, forLeaderboardID leaderboardID: String) {
        let scoreReporter = GKScore(leaderboardIdentifier: leaderboardID)
        scoreReporter.value = score
        GKScore.report([scoreReporter]) { error in
            if let error = error {
                print("Error reporting score: \(error.localizedDescription)")
            }
        }
    }
}

extension GameCenterManager: GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true)
    }
}
