//
//  PauseComponent.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 26/06/24.
//

import SwiftUI

struct PauseComponent: View {
    let retryAction: () -> Void
    let exitAction: () -> Void
    let resumeAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: retryAction, label: {
                    VStack(alignment:.center) {
                        Image(systemName: "arrow.clockwise")
                            .bold()
                            .rotationEffect(Angle(degrees: 45))
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        Text("Retry")
                            .padding(.top, 1)
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }
                })
                Spacer()
                    .frame(width: 40)
                Button(action: exitAction, label: {
                    VStack(alignment:.center) {
                        Image(systemName: "square.and.arrow.up")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: 90))
                        
                        Text("Exit")
                            .padding(.top, 1)
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.white)

                    }
                })
                Spacer()
                    .frame(width: 40)
                Button(action: resumeAction, label: {
                    VStack(alignment:.center) {
                        Image(systemName: "play.fill")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                        Text("Resume")
                            .padding(.top, 1)
                            .font(Font.system(size: 14))
                            .fontWeight(.light)
                            .foregroundColor(.white)

                    }
                })
                Spacer()
                    .frame(width: 50)
            }
            .padding(.top, 12)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(.accent)
        }
        .frame(maxHeight: .infinity, alignment: .top)

    }
}

#Preview {
    PauseComponent(
        retryAction: {},
        exitAction: {},
        resumeAction: {}
    )
}
