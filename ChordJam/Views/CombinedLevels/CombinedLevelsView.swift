//
//  CombinedLevelsView.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 18/06/24.
//

import SwiftUI

struct CombinedLevelsView: View {
    @State private var showNextLevelView = false
    @State private var showLevel1View = false

    @Binding var unlockedLevel: Int

    var body: some View {
        Group {
            if showLevel1View {
                Level1View(unlockedLevel: $unlockedLevel)
            } else {
                ModalLevel1()
                    .onAppear {
                        // Start a timer to switch the view after 2 seconds
                        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                            withAnimation {
                                showLevel1View = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    CombinedLevelsView(unlockedLevel: .constant(1))
}
