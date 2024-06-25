//
//  CombinedLevels2View.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 24/06/24.
//

import SwiftUI

struct CombinedLevels2View: View {
//    @StateObject var manager = LevelsController()
    @State private var showNextLevelView = false
    @State private var showLevel2View = false
    
    var body: some View {
        Group {
                   if showLevel2View {
                        Level2View()
                    } else {
                        ModalLevel2()
                            .onAppear {
                                // Start a timer to switch the view after 2 seconds
                                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                                    withAnimation {
                                        showLevel2View = true
                                    }
                                }
                            }
                    }
                }
    }
}

#Preview {
    CombinedLevels2View()
}
