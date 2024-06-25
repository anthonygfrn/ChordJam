//
//  ModalLevel4.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 25/06/24.
//

import SwiftUI

struct ModalLevel4: View {
    var body: some View {
        Image("Modal4")
            .resizable()
            
            .ignoresSafeArea()
//            .aspectRatio(contentMode: .fit)
            .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    ModalLevel4()
}
