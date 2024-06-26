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
    @State var show1: Bool = true
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
    @State var show17: Bool = false
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
    @State var show29: Bool = false
    @State var show30: Bool = false
    @State var show31: Bool = false
    @State var show32: Bool = false
    @State var show33: Bool = false
    @State var show34: Bool = false
    @State var show35: Bool = false
    @State var show36: Bool = false
    @State var show37: Bool = false
    @State var show38: Bool = false
    @State var show39: Bool = false
    @State var show40: Bool = false
    @State var successString: Bool = false
    @State private var successCase: SuccessCase = .none
    @State private var detectedString: String? = nil
    @StateObject var stringDetection = StringDetection()
    @Binding var unlockedLevel: Int
        
    var body: some View {
        NavigationView{
            ZStack {
                if successString {
                    OnboardImage(Onboard: "Validation")
                        .onTapGesture {
                            handleSuccessTap()
                        }
                }
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
                                show29 = true
                                show15 = false
                            }
                        })
                }
                if show29 {
                    OnboardImage(Onboard: "Onboarding 62")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show30 = true
                                show16 = false
                            }
                        })
                }
                if show30 {
                    OnboardImage(Onboard: "Onboarding 64")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show17 = true
                                show29 = false
                            }
                        })
                }
                if show17 {
                    OnboardImage(Onboard: "Onboarding 19")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show18 = true
                                show30 = false
                                showBar = true
                            }
                        })
                }
                if show18 {
                    OnboardImage(Onboard: "Onboarding 20")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show31 {
                    OnboardImage(Onboard: "Onboarding 66")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show19 = true
                                progress = 0
                                successString = false
                            }
                        })
                }
                if show19 {
                    OnboardImage(Onboard: "Onboarding 55")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show20 = true
                                show31 = false
                                showBar = true
                            }
                        })
                }
                if show20 {
                    OnboardImage(Onboard: "Onboarding 45")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show32 {
                    OnboardImage(Onboard: "Onboarding 68")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show21 = true
                                progress = 0
                                successString = false
                            }
                        })
                }
                if show21 {
                    OnboardImage(Onboard: "Onboarding 56")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show22 = true
                                show32 = false
                                showBar = true
                            }
                        })
                }
                if show22 {
                    OnboardImage(Onboard: "Onboarding 46")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show33 {
                    OnboardImage(Onboard: "Onboarding 70")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show23 = true
                                progress = 0
                                successString = false
                            }
                        })
                }
                if show23 {
                    OnboardImage(Onboard: "Onboarding 57")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show24 = true
                                show33 = false
                                showBar = true
                            }
                        })
                }
                if show24 {
                    OnboardImage(Onboard: "Onboarding 47")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show34 {
                    OnboardImage(Onboard: "Onboarding 72")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show25 = true
                                progress = 0
                                successString = false
                            }
                        })
                }
                if show25 {
                    OnboardImage(Onboard: "Onboarding 58")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show26 = true
                                show34 = false
                                showBar = true
                            }
                        })
                }
                if show26 {
                    OnboardImage(Onboard: "Onboarding 48")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show35 {
                    OnboardImage(Onboard: "Onboarding 74")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show27 = true
                                progress = 0
                                successString = false
                            }
                        })
                }
                if show27 {
                    OnboardImage(Onboard: "Onboarding 59")
                        .onTapGesture(perform: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                show28 = true
                                show35 = false
                                showBar = true
                            }
                        })
                }
                if show28 {
                    OnboardImage(Onboard: "Onboarding 49")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                stringDetection.start()
                            }
                        }
                }
                if show36 {
                                    NavigationLink(destination: MainMenuView(unlockedLevel: $unlockedLevel).navigationBarBackButtonHidden()) {
                                        OnboardImage(Onboard: "Finishing Onboarding")
                                    }
                                }
                if showBar {
                    ProgressBar(progress: CGFloat(progress), total: 90)
                        .padding(.trailing, 410)
                        .padding(.bottom, 280)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: MainMenuView(unlockedLevel: $unlockedLevel).navigationBarBackButtonHidden()) {
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
        .onReceive(stringDetection.$data) { newData in
            checkNoteDetection(newData.noteNameWithSharps)
        }
    }
    
    func handleSuccessTap() {
        switch successCase {
        case .E4:
            withAnimation(.easeIn(duration: 0.5)) {
                show31 = true
            }
            print("E4 tapped")
        case .B3:
            withAnimation(.easeIn(duration: 0.5)) {
                show32 = true
            }
            print("B3 tapped")
        case .G3:
            withAnimation(.easeIn(duration: 0.5)) {
                show33 = true
            }
            print("G3 tapped")
        case .D3:
            withAnimation(.easeIn(duration: 0.5)) {
                show34 = true
            }
            print("D3 tapped")
        case .A3:
            withAnimation(.easeIn(duration: 0.5)) {
                show35 = true
            }
            print("A3 tapped")
        case .none:
            break
        }
    }
    
    func checkNoteDetection(_ note: String) {
        switch note {
        case "E4":
            if show18 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            successString = true
                            successCase = .E4
                            show17 = false
                            show18 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 1
                }
            }
        case "B3":
            if show20 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            successString = true
                            successCase = .B3
                            show19 = false
                            show20 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 1
                }
            }
        case "G3":
            if show22 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            successString = true
                            successCase = .G3
                            show21 = false
                            show22 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 1
                }
            }
        case "D3":
            if show24 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            successString = true
                            successCase = .D3
                            show23 = false
                            show24 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 1
                }
            }
        case "A3":
            if show26 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            successString = true
                            successCase = .A3
                            show25 = false
                            show26 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 10
                }
            }
        case "E2":
            if show28 {
                if progress == 90 || Int(progress - 1) / 30 + 1 == 3 {
                    stringDetection.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation (.easeIn(duration: 0.5)) {
                            show36 = true
                            show27 = false
                            show28 = false
                            showBar = false
                        }
                    }
                } else {
                    progress += 1
                }
            }
        default:
            break
        }
    }
}

#Preview {
    Onboarding(unlockedLevel: .constant(1))
}
