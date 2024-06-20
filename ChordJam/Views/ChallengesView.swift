//
//  ChallengesView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

struct ChallengesView: View {
    
    @State private var currentView: String = "Challenges"
    
    var body: some View {
        VStack {
            Text("Challenges")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            NavBar(currentView: $currentView)
        }
    }
}

#Preview {
    ChallengesView()
}
