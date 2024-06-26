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
    var onFinish: () -> Void
    var onStartOnboarding: () -> Void // Added a new closure for starting onboarding

    var body: some View {
        ZStack {
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
            if showButton {
                VStack {
                    Button(action: {
                        onFinish()
                    }) {
                        Text("Yes, skip onboarding")
                            .frame(width: 200, height: 52)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.system(size: 16, weight: .bold))
                    }
                    .position(x: 277, y: 223)
                    Button(action: {
                        onStartOnboarding() // Call the new closure when "No" is clicked
                    }) {
                        Text("No")
                            .frame(width: 200, height: 52)
                            .background(Color.color1)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.system(size: 16, weight: .bold))
                    }
                    .position(x: 528, y: 33)
                }
            }
        }
    }
}

#Preview {
    Introduction(onFinish: {}, onStartOnboarding: {})
}
