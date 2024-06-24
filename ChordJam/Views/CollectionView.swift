//
//  CollectionView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

struct CollectionView: View {
    
    var body: some View {
        VStack {
            Text("Collection")
                .font(.largeTitle)
                .padding()
            
            VStack {
                Spacer()
                NavBar()
            }
            .padding(.bottom, -30)
        }
    }
}

#Preview {
    ChallengesView()
}
