//
//  SampleFretboard.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 18/06/24.
//

import SwiftUI

enum Strumming: String {
    case up = "up"
    case down = "down"
}

struct Chord: Identifiable {
    let id = UUID()
    let name: String
    let time: Double
    let strumming: Strumming
}


struct FretboardView: View {
    @ObservedObject var viewModel = LyricsViewModel(lyricsProvider: LyricsProvider())
    
    let chords: [Chord] = [
        Chord(name: "G", time: 0, strumming: .up),
        Chord(name: "G", time: 0.5, strumming: .up),
        Chord(name: "G", time: 1, strumming: .up),
        Chord(name: "G", time: 1.5, strumming: .up),
        Chord(name: "Em", time: 2, strumming: .up),
        Chord(name: "D", time: 4, strumming: .up),
        Chord(name: "C", time: 6, strumming: .up),
        Chord(name: "G", time: 8, strumming: .up),
        Chord(name: "C", time: 10, strumming: .up),
        Chord(name: "G", time: 12, strumming: .up),
        Chord(name: "D", time: 14, strumming: .up),
        Chord(name: "G", time: 16, strumming: .up),
        Chord(name: "Em", time: 18, strumming: .up),
        Chord(name: "D", time: 20, strumming: .up),
        Chord(name: "C", time: 22, strumming: .up),
        Chord(name: "G", time: 24, strumming: .up),
        Chord(name: "C", time: 26, strumming: .up),
        Chord(name: "G", time: 28, strumming: .up),
        Chord(name: "D", time: 30, strumming: .up),
        Chord(name: "G", time: 32, strumming: .up),
    ]
    
    @State private var offset: CGFloat = 122
    @State private var contentWidth: CGFloat = 0
    @State private var viewLoaded: Bool = false
    var fretViewWidth: CGFloat = 300
    var desiredDuration: Double = 2
    var speed: Double = 0.01 // This is the time interval for the timer, in seconds
    private var scrollSpeed: CGFloat {
        fretViewWidth / CGFloat(desiredDuration / speed)
    }
    private var getFretBoardLong: Int {
        return Int(ceil(Double(chords.last!.time) / 2.0 )) + 4
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<getFretBoardLong) { index in
                            FretView(index: index, chords: chords)
                        }
                        Spacer()
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                if !viewLoaded {
                                    contentWidth = proxy.size.width
                                    viewLoaded = true
                                    //                                    startAnimation()
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
                        .frame(width: 8, height: 300)
                        .offset(x: -300)
                        .shadow(color: .accent, radius: 10, x: 0, y: 0)
                        .blur(radius: 2)
                    
                    VStack {
                        Text("test")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.opacity)
                    }
                    .offset(y: 160)
                    .onAppear {
                        
                    }
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
        
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            offset -= scrollSpeed
            if offset <= -contentWidth {
                offset = 122
            }
        }
    }
}

struct FretView: View {
    var index: Int
    var chords: [Chord]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<6) { string in
                StringView(
                    thickness: CGFloat(1 + Float(string) * 0.5)
                ).overlay {
                    HStack {
                        //                        NoteView(note: "\(index)")
                        
                    }.offset(x: -50)
                }
            }
        }
        .background(.black)
        .frame(width: 300)
        .overlay {
            ChordOverlay(index: index, chords: chords)
        }
    }
}

struct ChordOverlay: View {
    var index: Int
    var chords: [Chord]
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(.white)
                .frame(width: 0.5, height: 270)
            if(index >= 1) {
                ZStack{
                    ForEach(getChords(index: index)) { chord in
                        ChordView(chord: chord)
                    }
                }
            }
            Spacer()
        }
    }
    
    func getChords(index: Int) -> [Chord] {
        let startTime = Double((index - 2) * 2)
        let endTime = startTime + 2
        return chords.filter { startTime <= $0.time && $0.time < endTime }
    }
}

struct ChordView: View {
    var chord: Chord
    @State private var timePassed = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(.accent)
                .frame(width: 64, height: CGFloat(getChordHeight()), alignment: .top)
                .cornerRadius(10)
                .overlay {
                    VStack(alignment: .center){
                        Text("\(chord.name)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        //                        if(chord.strumming == .up){
                        //                            Image(systemName: "arrow.up")
                        //                                .foregroundColor(.black)
                        //                        } else {
                        //                            Image(systemName: "arrow.down")
                        //                                .foregroundColor(.black)
                        //                        }
                    }
                }
        }.frame(height: 250, alignment: .top)
            .offset(x:CGFloat(getChordOffset()))
            .onReceive(timer) { _ in
                print("\(timer)")
                if self.chord.time < Date().timeIntervalSince1970 {
                    self.timePassed = true
                }
            }
    }
    
    // 3 120
    // 4 160
    // 5 210
    // 6 250
    
    
    func getChordHeight() -> Int {
        switch(chord.name){
        case "D":
            return 120
        case "G":
            return 250
        case "Em":
            return 210
        case "C":
            return 210
        default:
            return 250
        }
    }
    
    func getChordOffset() -> Int {
        let time = chord.time.truncatingRemainder(dividingBy: 2)
        if time == 0 {
            return 0
        } else if time == 0.5 {
            return 72
        } else if time == 1 {
            return 145
        } else if time == 1.5 {
            return 220
        } else {
            return 0
        }
    }
}

struct NoteView: View {
    @State private var isTapped = false
    var note: String
    
    var body: some View {
        Text(note)
            .foregroundColor(.black)
            .padding(.all, 5)
            .background(isTapped ? Color.blue : Color.white)
            .cornerRadius(10)
            .onTapGesture {
                isTapped.toggle()
            }
    }
}

struct StringView: View {
    var thickness: CGFloat
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(height: thickness)
            .padding(.vertical, 17)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FretboardView()
}
