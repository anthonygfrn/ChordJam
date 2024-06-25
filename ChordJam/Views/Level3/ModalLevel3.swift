//
//  ModalLevel3.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 24/06/24.
//

import SwiftUI

struct ModalLevel3: View {
    var body: some View {
        Image("Modal3")
            .resizable()
            
            .ignoresSafeArea()
//            .aspectRatio(contentMode: .fit)
            .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ModalLevel3()
}
