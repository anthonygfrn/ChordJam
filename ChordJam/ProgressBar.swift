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
                .frame(width: widthForProgress(progress == 0 ? 0 : Int(progress - 1) / 30 + 1), height: 32)
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            HStack {
                Spacer()
                Text("\(progress == 0 ? 0 : Int(progress - 1) / 30 + 1) / \(total / 30)")
                    .foregroundColor(.white)
                    .padding(.trailing, 15)
                    .font(.system(size: 17, weight: .bold))
            }
        }
        .frame(width: 264, height: 32)
    }
    
    func widthForProgress(_ progress: Int) -> CGFloat {
            switch progress {
            case 0:
                return 0
            case 1, 2, 3:
                return CGFloat(88 * progress)
            default:
                return 0
            }
        }
}

#Preview {
    ProgressBar(progress: 1, total: 90)
}
