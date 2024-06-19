//
//  OnboardImage.swift
//  ChordJams
//
//  Created by Ferdinand Jacques on 17/06/24.
//

import SwiftUI

struct OnboardImage: View {
    var Onboard: String
    
    var body: some View {
        Image(Onboard)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
    }
}
