//
//  CombinedLevels4View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 25/06/24.
//

import SwiftUI

struct CombinedLevels4View: View {
    @State private var showNextLevelView = false
    @State private var showLevel4View = false
    @Binding var unlockedLevel: Int
    var body: some View {
        Group {
                   if showLevel4View {
                        Level4View(unlockedLevel: .constant(2))
                    } else {
                        ModalLevel4()
                            .onAppear {
                                // Start a timer to switch the view after 2 seconds
                                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                                    withAnimation {
                                        showLevel4View = true
                                    }
                                }
                            }
                    }
                }
    }
}

#Preview {
    CombinedLevels4View(unlockedLevel: .constant(2))
}
