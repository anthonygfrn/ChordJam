//
//  CollectionView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

struct CollectionView: View {
    
    @State private var currentView: String = "Collection"
    
    var body: some View {
        VStack {
            Text("Collection")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    CollectionView()
}
