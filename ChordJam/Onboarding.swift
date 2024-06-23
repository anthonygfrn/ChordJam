//
//  Onboarding.swift
//  ChordJams
//
//  Created by Ferdinand Jacques on 17/06/24.
//

import SwiftUI

struct Onboarding: View {
    @State var showBar: Bool = false
    @State var progress: Int = 0
    @State var show1: Bool = false
    @State var show2: Bool = false
    @State var show3: Bool = false
    @State var show4: Bool = false
    @State var show5: Bool = false
    @State var show6: Bool = false
    @State var show7: Bool = false
    @State var show8: Bool = false
    @State var show9: Bool = false
    @State var show10: Bool = false
    @State var show11: Bool = false
    @State var show12: Bool = false
    @State var show13: Bool = false
    @State var show14: Bool = false
    @State var show15: Bool = false
    @State var show16: Bool = false
    @State var show17: Bool = true
    @State var show18: Bool = false
    @State var show19: Bool = false
    @State var show20: Bool = false
    @State var show21: Bool = false
    @State var show22: Bool = false
    @State var show23: Bool = false
    @State var show24: Bool = false
    @State var show25: Bool = false
    @State var show26: Bool = false
    @State var show27: Bool = false
    @State var show28: Bool = false
    @State private var detectedString: String? = nil
        
    var body: some View {
        NavigationView{
            ZStack {
                if show1 {
                    OnboardImage(Onboard: "Onboarding 3")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show2 = true
                            }
                        })
                }
                if show2 {
                    OnboardImage(Onboard: "Onboarding 4")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 1.0)){
                                show3 = true
                                show1 = false
                            }
                        })
                }
                if show3 {
                    OnboardImage(Onboard: "Onboarding 5")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show4 = true
                                show2 = false
                            }
                        })
                }
                if show4 {
                    OnboardImage(Onboard: "Onboarding 6")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show5 = true
                                show3 = false
                            }
                        })
                }
                if show5 {
                    OnboardImage(Onboard: "Onboarding 7")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show6 = true
                                show4 = false
                            }
                        })
                }
                if show6 {
                    OnboardImage(Onboard: "Onboarding 8")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show7 = true
                                show5 = false
                            }
                        })
                }
                if show7 {
                    OnboardImage(Onboard: "Onboarding 9")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show8 = true
                                show6 = false
                            }
                        })
                }
                if show8 {
                    OnboardImage(Onboard: "Onboarding 10")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show9 = true
                                show7 = false
                            }
                        })
                }
                if show9 {
                    OnboardImage(Onboard: "Onboarding 11")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show10 = true
                                show8 = false
                            }
                        })
                }
                if show10 {
                    OnboardImage(Onboard: "Onboarding 12")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show11 = true
                                show9 = false
                            }
                        })
                }
                if show11 {
                    OnboardImage(Onboard: "Onboarding 13")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show12 = true
                                show10 = false
                            }
                        })
                }
                if show12 {
                    OnboardImage(Onboard: "Onboarding 14")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show13 = true
                                show11 = false
                            }
                        })
                }
                if show13 {
                    OnboardImage(Onboard: "Onboarding 15")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show14 = true
                                show12 = false
                            }
                        })
                }
                if show14 {
                    OnboardImage(Onboard: "Onboarding 16")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show15 = true
                                show13 = false
                            }
                        })
                }
                if show15 {
                    OnboardImage(Onboard: "Onboarding 17")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show16 = true
                                show14 = false
                            }
                        })
                }
                if show16 {
                    OnboardImage(Onboard: "Onboarding 18")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show17 = true
                                show15 = false
                            }
                        })
                }
                if show17 {
                    OnboardImage(Onboard: "Onboarding 19")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show18 = true
                                show16 = false
                                showBar = true
                            }
                        })
                }
                if show18 {
                    OnboardImage(Onboard: "Onboarding 20")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startHighEStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show19 = true
                                show17 = false
                            }
                            withAnimation(.easeOut(duration: 0.5)) {
                                showBar = false
                            }
                        })
                }
                if show19 {
                    OnboardImage(Onboard: "Onboarding 55")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show20 = true
                                show18 = false
                                showBar = true
                            }
                        })
                }
                if show20 {
                    OnboardImage(Onboard: "Onboarding 45")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startBStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show21 = true
                                show19 = false
                                showBar = false
                            }
                        })
                }
                if show21 {
                    OnboardImage(Onboard: "Onboarding 56")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show22 = true
                                show20 = false
                                showBar = true
                            }
                        })
                }
                if show22 {
                    OnboardImage(Onboard: "Onboarding 46")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startGStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show23 = true
                                show21 = false
                                showBar = false
                            }
                        })
                }
                if show23 {
                    OnboardImage(Onboard: "Onboarding 57")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show24 = true
                                show22 = false
                                showBar = true
                            }
                        })
                }
                if show24 {
                    OnboardImage(Onboard: "Onboarding 47")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startDStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show25 = true
                                show23 = false
                                showBar = false
                            }
                        })
                }
                if show25 {
                    OnboardImage(Onboard: "Onboarding 58")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show26 = true
                                show24 = false
                                showBar = true
                            }
                        })
                }
                if show26 {
                    OnboardImage(Onboard: "Onboarding 48")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startAStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show27 = true
                                show25 = false
                                showBar = false
                            }
                        })
                }
                if show27 {
                    OnboardImage(Onboard: "Onboarding 59")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show28 = true
                                show26 = false
                                showBar = true
                            }
                        })
                }
                if show28 {
                    OnboardImage(Onboard: "Onboarding 49")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                startLowEStringDetection()
                            }
                        }
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show23 = true
                                show21 = false
                                showBar = false
                            }
                        })
                }
                
                if showBar {
                    ProgressBar(progress: CGFloat(progress), total: 3)
                        .padding(.trailing, 410)
                        .padding(.bottom, 280)
                }
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: MainMenuView()) {
                            Text("Skip")
                                .frame(width: 50, height: 50)
                                .background(.color2)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.system(size: 14, weight: .bold))
                                .padding(.top, 11)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    func startLowEStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("E2") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
    
    func startAStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("A2") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
    
    func startDStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("D3") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
    
    func startGStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("G3") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
    
    func startBStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("B3") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
    
    func startHighEStringDetection() {
        let detector = GuitarStringDetector()
        detector.startDetection { string in
            DispatchQueue.main.async {
                self.detectedString = string
                if let detectedString = detectedString, detectedString.contains("E4") {
                    progress += 1
                }
                if progress == 3 {
                    detector.stopDetection()
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
