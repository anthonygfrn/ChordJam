//
//  Level6View.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 23/06/24.
//

import SwiftUI

struct Level6View: View {
    @ObservedObject var viewModel = Level6ViewModel()
    
    @State private var offset: CGFloat = 122
    @State private var contentWidth: CGFloat = 0
    @State private var viewLoaded: Bool = false
    var fretViewWidth: CGFloat = 300
    var desiredDuration: Double = 2
    var speed: Double = 0.01
    private var scrollSpeed: CGFloat {
        fretViewWidth / CGFloat(desiredDuration / speed)
    }
    private var getFretBoardLong: Int {
        return Int(ceil(Double(viewModel.lyrics.last!.time) / 2.0 )) + 4
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    LazyHStack(spacing: 0) {
                        ForEach(2..<getFretBoardLong) { index in
                            FretView(index: index, chords: viewModel.chords)
                        }
                        Spacer()
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                if !viewLoaded {
                                    contentWidth = proxy.size.width
                                    viewLoaded = true
                                }
                            }
                        }
                    )
                    .offset(x: offset)
                }
                .frame(width: geometry.size.width, alignment: .bottomLeading)
            }
            .overlay(
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.accent)
                        .frame(width: 8, height: 270)
                        .offset(x: -300)
                        .shadow(color: .accent, radius: 10, x: 0, y: 0)
                        .blur(radius: 2)
                    
                    VStack {
                        Text(viewModel.currentLyric)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    .offset(y: 160)
                    .animation(.easeInOut(duration: 0.5), value: viewModel.currentLyric)
                    
                    Button(action: {
                        viewModel.startLyrics()
                    }, label: {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    })
                    .offset(x: 350, y: -160)
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .frame(maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "2A2A2A"), Color(hex: "434343")]), startPoint: .leading, endPoint: .trailing)
        )
        .onReceive(viewModel.$currentTime, perform: { _ in
            
            if viewLoaded {
                offset -= scrollSpeed
                if offset <= -contentWidth {
                    offset = 122
                }
            }
        })
        
    }
}

#Preview {
    Level6View()
}
