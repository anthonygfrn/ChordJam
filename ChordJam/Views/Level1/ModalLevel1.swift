//  ModalLevel1.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct ModalLevel1: View {
    @State var Opacity: Double = 0.0
    @State var Opacity1: Double = 0.0
    @State var Opacity2: Double = 0.0
    @State var Opacity3: Double = 0.0
    @State var Opacity4: Double = 0.0
    @State var Opacity5: Double = 0.0
    @State var Opacity6: Double = 0.0
    @State var Opacity7: Double = 0.0
    @State var Opacity8: Double = 0.0
    
    var body: some View {
        ZStack {
            OnboardImage(Onboard: "Level Stage 1")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage1")
                .opacity(Opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity2 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage2")
                .opacity(Opacity2)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity3 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage3")
                .opacity(Opacity3)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity4 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage4")
                .opacity(Opacity4)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity5 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage5")
                .opacity(Opacity5)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity6 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage6")
                .opacity(Opacity6)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity7 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage7")
                .opacity(Opacity7)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity8 = 1.0
                        }
                    }
                }
            OnboardImage(Onboard: "stage8")
                .opacity(Opacity8)
        }
    }
}

#Preview {
    ModalLevel1()
}
