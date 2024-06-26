//
//  LearnSong.swift
//  ChordJam
//
//  Created by Ferdinand Jacques on 26/06/24.
//

import SwiftUI

struct LearnSong: View {
    @State var Opacity: Double = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                OnboardImage(Onboard: "learn")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeIn(duration: 0.5)) {
                                Opacity = 1.0
                            }
                        }
                    }
                NavigationLink(destination: Level6View().navigationBarBackButtonHidden()){
                    OnboardImage(Onboard: "songs")
                }
                .opacity(Opacity)
            }
        }
    }
}

#Preview {
    LearnSong()
}
