//
//  CombinedLevels3View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 24/06/24.
//

import SwiftUI

struct CombinedLevels3View: View {
    @State private var showNextLevelView = false
    @State private var showLevel3View = false
    @Binding var unlockedLevel: Int
    
    var body: some View {
        Group {
                   if showLevel3View {
                        Level3View(unlockedLevel: $unlockedLevel)
                    } else {
                        ModalLevel3()
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                                    withAnimation {
                                        showLevel3View = true
                                    }
                                }
                            }
                    }
                }
    }
}

#Preview {
    CombinedLevels3View(unlockedLevel: .constant(3))
}
