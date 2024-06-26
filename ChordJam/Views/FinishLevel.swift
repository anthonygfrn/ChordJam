import SwiftUI

struct FinishLevel: View {
    @Binding var unlockedLevel: Int
    @StateObject var manager = chordModel()
    @State private var navigateToMainMenu = false
    @EnvironmentObject var gameCenterManager: GameCenterManager
    
    @State private var showNotification = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundLevel")
                    .resizable()

                VStack(spacing: 30.0) {
                    VStack(spacing: 20.0) {
                        Text("Congratulations!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.white)

                        Image("Exp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 326, height: 35)
                    }

                    HStack(spacing: 100.0) {
                        Button(action: {}, label: {
                            Image("RetryButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 51, height: 95)
                        })

                        Button(action: {
                            unlockNextLevel()
                            navigateToMainMenu = true
                        }, label: {
                            Image("ContinueButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 86, height: 94)
                        })
                    }
                    .padding()
                    NavigationLink(destination: MainMenuView(unlockedLevel: $unlockedLevel).environmentObject(gameCenterManager).onAppear {
                        unlockNextLevel()
                    }, isActive: $navigateToMainMenu) {
                        EmptyView()
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
            .ignoresSafeArea()
            
//            if showNotification{
//                BadgeNotif()
//                    .offset(y: -100)
////                    .padding(.top, 50)
//            }
            
        }
        .navigationBarBackButtonHidden(true)
//        .onAppear{
//            withAnimation{
//                showNotification = true
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                withAnimation {
//                    showNotification = false
//                }
//            }
//    
//        }
        .overlay(
                        BadgeNotif()
                            .offset(y: -150) // Adjust this value to control the starting position
                    )
    }

    private func unlockNextLevel() {
        if manager.currentLevel == 1 && unlockedLevel < 2 {
            unlockedLevel = 2
        } else if manager.currentLevel == 2 && unlockedLevel < 3 {
            unlockedLevel = 3
        } else if manager.currentLevel == 3 && unlockedLevel < 4 {
            unlockedLevel = 4
        } else if manager.currentLevel == 4 && unlockedLevel < 5 {
            unlockedLevel = 5
        } else if manager.currentLevel == 5 && unlockedLevel < 6 {
            unlockedLevel = 6
        }
    }
}

#Preview {
    FinishLevel(unlockedLevel: .constant(1))
}
