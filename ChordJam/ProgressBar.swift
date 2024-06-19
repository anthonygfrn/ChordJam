//
//  ProgressBar.swift
//  ChordJams
//
//  Created by Ferdinand Jacques on 18/06/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var total: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 22)
                .fill(.color3)
                .frame(width: 264, height: 32)
            RoundedRectangle(cornerRadius: 22)
                .fill(.color4)
                .frame(width: progress * 88, height: 32)
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            HStack {
                Spacer()
                Text("\(Int(progress)) / \(total)")
                    .foregroundColor(.white)
                    .padding(.trailing, 15)
                    .font(.system(size: 17, weight: .bold))
            }
        }
        .frame(width: 264, height: 32)
    }
}

#Preview {
    ProgressBar(progress: 1, total: 3)
}
