//
//  MainMenuView.swift
//  ChordJam
//
//  Created by Anthony on 17/06/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var gameCenterManager: GameCenterManager
    
    @State private var isAnimating = false
    @State private var navigateToLevel1 = false
    @State private var navigateToLevel2 = false
    @State private var navigateToLevel3 = false
    @State private var navigateToLevel4 = false
    @State private var navigateToChallenges = false
    @State private var navigateToLeaderboard = false
    @State private var navigateToCollection = false
    @State private var navigateToProfile = false
    
    @State private var currentView: String = "Home"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("main")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: geometry.size.width * 0.387)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    Button(action: {
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isAnimating = false
                            self.navigateToLevel4 = true
                        }
                    }) {
                        Image("locked")
                            .resizable()
                            .frame(width: 71.88, height: 71.88)
                    }
                    .position(x: 720, y: 285)

                    Button(action: {
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isAnimating = false
                            self.navigateToLevel3 = true
                        }
                    }) {
                        Image("locked")
                            .resizable()
                            .frame(width: 71.88, height: 71.88)
                    }
                    .position(x: 530, y: 75)
                    
                    Button(action: {
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isAnimating = false
                            self.navigateToLevel2 = true
                        }
                    }) {
                        Image("locked")
                            .resizable()
                            .frame(width: 71.88, height: 71.88)
                            .offset(x: -25, y: 3)
                    }
                    
                    Button(action: {
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isAnimating = false
                            self.navigateToLevel1 = true
                        }
                    }) {
                        Image("onboarding")
                            .resizable()
                            .frame(width: 91.36, height: 91.36)
                            .offset(x: -175, y: -195)
                    }
                }
                .padding()
                
                VStack {
                    Spacer()
                    NavBar(currentView: $currentView)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToLevel4) {
                Level4View()
            }
            .navigationDestination(isPresented: $navigateToLevel3) {
                Level3View()
            }
            .navigationDestination(isPresented: $navigateToLevel2) {
                Level2View()
            }
            .navigationDestination(isPresented: $navigateToLevel1) {
                Level1View()
            }
            .navigationDestination(isPresented: $navigateToChallenges) {
                ChallengesView()
            }
            .navigationDestination(isPresented: $navigateToLeaderboard) {
                LeaderboardView()
            }
            .navigationDestination(isPresented: $navigateToCollection) {
                CollectionView()
            }
            .navigationDestination(isPresented: $navigateToProfile) {
                ProfileView()
            }
            .onAppear(){
                UIScreen.main.brightness = 0.5
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    MainMenuView()
}
