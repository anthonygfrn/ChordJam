//
//  Introduction.swift
//  ChordJams
//
//  Created by Ferdinand Jacques on 15/06/24.
//

import SwiftUI

struct Introduction: View {
    @State var Opacity: Double = 0.0
    @State var showButton: Bool = false
    @State private var navigateToOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !navigateToOnboarding {
                    OnboardImage(Onboard: "Onboarding 1")
                    OnboardImage(Onboard: "Onboarding 2")
                        .opacity(Opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    Opacity = 1.0
                                    showButton = true
                                }
                            }
                        }
                    if showButton{
                        Button(action: {
                            //Skip onboarding
                            print("Button tapped!")
                        }) {
                            Text("Yes, skip onboarding")
                                .frame(width: 200, height: 52)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .position(x: 275, y: 223)
                                .font(.system(size: 16, weight: .bold))
                        }
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                navigateToOnboarding = true
                            }
                        }) {
                            Text("No")
                                .frame(width: 200, height: 52)
                                .background(.color1)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .position(x: 529, y: 223)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                else {
                    Onboarding()
                        .transition(.opacity)
                        .animation(.easeIn(duration: 1.0), value: navigateToOnboarding)
                }
            }
        }
    }
}

#Preview {
    Introduction()
}
