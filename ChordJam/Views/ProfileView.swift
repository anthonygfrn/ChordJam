//
//  ProfileView.swift
//  ChordJam
//
//  Created by Anthony on 18/06/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var currentView: String = "Profile"
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            NavBar(currentView: $currentView)
        }
    }
}

#Preview {
    ProfileView()
}
