//
//  ModalLevel2.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 19/06/24.
//

import SwiftUI

struct ModalLevel2: View {
    var body: some View {
        Image("Modal2")
            .resizable()
            
            .ignoresSafeArea()
//            .aspectRatio(contentMode: .fit)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ModalLevel2()
}
