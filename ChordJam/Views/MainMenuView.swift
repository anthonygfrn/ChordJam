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

    @State private var scrollOffset: CGFloat = 0

    private let imageSize: CGFloat = 71.88
    private let onboardingImageSize: CGFloat = 91.36
    private let animationDuration: Double = 0.5

    var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            backgroundView(geometry: geometry)
                            
                            VStack(spacing: 20) {
                                levelButtons(geometry: geometry)
                            }
                            .padding()
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: geometry.size.height)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newOffset = scrollOffset - value.translation.width
                                scrollOffset = max(0, min(newOffset, geometry.size.width))
                            }
                    )
                    
                    VStack {
                        Spacer()
                        NavBar()
                    }
                    .padding(.bottom, -30)
                }
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $navigateToLevel4) { Level4View() }
                .navigationDestination(isPresented: $navigateToLevel3) { Level3View() }
                .navigationDestination(isPresented: $navigateToLevel2) { Level2View() }
                .navigationDestination(isPresented: $navigateToLevel1) { Level1View() }
                .navigationDestination(for: String.self) { targetView in
                    switch targetView {
                    case "Challenges":
                        ChallengesView()
                    case "Leaderboard":
                        LeaderboardView()
                    case "Collection":
                        CollectionView()
                    case "Profile":
                        ProfileView()
                    default:
                        Text("Invalid View")
                    }
                }
                
                .onAppear {
                    UIScreen.main.brightness = 0.5
                }
                .navigationBarBackButtonHidden(true)
            }
    }
        
        private func backgroundView(geometry: GeometryProxy) -> some View {
            Image("main")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width * 2.1, height: geometry.size.height * 1.12)
                .offset(x: scrollOffset, y: 10)
                .clipped()
        }
        
        private func levelButtons(geometry: GeometryProxy) -> some View {
            Group {
                button(imageName: "locked", action: { navigateToLevel3 = true })
                    .position(x: geometry.size.width * 1.1, y: geometry.size.height * 0.8 + 15)
                
                button(imageName: "locked", action: { navigateToLevel2 = true })
                    .position(x: geometry.size.width * 0.8 + 10, y: geometry.size.height * 0.2 + 15)
                
                button(imageName: "locked", action: { navigateToLevel1 = true })
                    .position(x: geometry.size.width * 0.4 + 91.5, y: geometry.size.height * 0.1 + 9)
                
                button(imageName: "onboarding", action: { navigateToLevel1 = true })
                    .frame(width: onboardingImageSize, height: onboardingImageSize)
                    .position(x: geometry.size.width * 0.3 + 25, y: geometry.size.height * -0.4 + 10)
            }
        }
        
        private func button(imageName: String, action: @escaping () -> Void) -> some View {
            Button(action: {
                isAnimating = true
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    isAnimating = false
                    action()
                }
            }) {
                Image(imageName)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
            }
        }
}

#Preview {
    MainMenuView()
}
