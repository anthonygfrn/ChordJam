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
    @State private var navigateToLevel5 = false
    @State private var navigateToLevel6 = false
    
    @State private var scrollOffset: CGFloat = 0
    @State private var unlockedLevel: Int = 0
    
    private let imageSize: CGFloat = 71.88
    private let onboardingImageSize: CGFloat = 91.36
    private let animationDuration: Double = 0.5
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack(alignment: .topLeading) {
                            backgroundView(geometry: geometry)
                            
                            VStack(spacing: 20) {
                                levelButtons(geometry: geometry)
                            }
                            .padding()
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: geometry.size.height)
                    .coordinateSpace(name: "scroll")
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newOffset = scrollOffset + value.translation.width
                                scrollOffset = max(0, min(newOffset, geometry.size.width * 2.1 - geometry.size.width))
                            }
                    )
                }
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    UIScreen.main.brightness = 0.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        unlockedLevel = max(unlockedLevel, 1) // Ensure level 1 is unlocked initially
                    }
                }
                .background(
                    Group {
                        NavigationLink(
                            destination: Level1View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel1,
                            label: { EmptyView() }
                        )
                        NavigationLink(
                            destination: Level2View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel2,
                            label: { EmptyView() }
                        )
                        NavigationLink(
                            destination: Level3View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel3,
                            label: { EmptyView() }
                        )
                        NavigationLink(
                            destination: Level4View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel4,
                            label: { EmptyView() }
                        )
                        NavigationLink(
                            destination: Level6View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel5,
                            label: { EmptyView() }
                        )
                        NavigationLink(
                            destination: Level6View(unlockedLevel: $unlockedLevel),
                            isActive: $navigateToLevel6,
                            label: { EmptyView() }
                        )
                    }
                )
            }
        }
    }
    
    private func backgroundView(geometry: GeometryProxy) -> some View {
        Image("main")
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width * 2.1, height: geometry.size.height * 1.5) // Adjust height multiplier to fit screen
            .offset(x: -scrollOffset, y: 0) // Adjust y-offset to center vertically
            .clipped()
    }
    
    private func levelButtons(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) { // Remove spacing to stick buttons close together
            button(imageName: "onboarding", action: {}, isLocked: false)
                .frame(width: onboardingImageSize, height: onboardingImageSize)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 0.2 + 60, geometry: geometry), y: geometry.size.height * 0.5 - 10)
            
            button(imageName: "C", action: { navigateToLevel1 = true }, isLocked: unlockedLevel < 1)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 0.4 + 58, geometry: geometry), y: geometry.size.height * 0.4 + 31)
            
            button(imageName: "Am", action: { navigateToLevel2 = true }, isLocked: unlockedLevel < 2)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 0.7 + 41, geometry: geometry), y: geometry.size.height * 0.05 + 35)
            
            button(imageName: "G", action: { navigateToLevel3 = true }, isLocked: unlockedLevel < 3)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 1 + 30, geometry: geometry), y: geometry.size.height * 0.2 + 25)
            
            button(imageName: "Dm", action: { navigateToLevel4 = true }, isLocked: unlockedLevel < 4)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 1.1 + 95, geometry: geometry), y: geometry.size.height * -0.1 + 35)
            
            button(imageName: "R", action: { navigateToLevel5 = true }, isLocked: unlockedLevel < 5)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 1.5 + 70, geometry: geometry), y: geometry.size.height * -0.4 + 30)
            
            button(imageName: "Song", action: { navigateToLevel6 = true }, isLocked: unlockedLevel < 6)
                .offset(x: scrollOffsetForButton(x: geometry.size.width * 1.8 + 50, geometry: geometry), y: geometry.size.height * -0.8 + 20)
        }
    }

    private func scrollOffsetForButton(x: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let totalContentWidth = geometry.size.width * 2.9 + 45 // Total width of the content including off-screen
        let offset = x - scrollOffset
        let maxXOffset = max(0, totalContentWidth - geometry.size.width)
        return max(0, min(offset, maxXOffset))
    }
    
    private func button(imageName: String, action: @escaping () -> Void, isLocked: Bool) -> some View {
        Button(action: {
            if !isLocked {
                isAnimating = true
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    isAnimating = false
                    action()
                }
            }
        }) {
            Image(isLocked ? "locked" : imageName)
                .resizable()
                .frame(width: imageSize, height: imageSize)
        }
        .disabled(isLocked)
    }
}

#Preview {
    MainMenuView()
}
