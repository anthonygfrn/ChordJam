//
//  SampleFretboard.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 18/06/24.
//

import SwiftUI

struct Chord: Identifiable {
    let id = UUID()
    let name: String
    let time: Double
}


struct FretboardView: View {
    
    let chords: [Chord] = [
        Chord(name: "C", time: 0),
        Chord(name: "C", time: 0.5),
        Chord(name: "C", time: 1),
        Chord(name: "C", time: 2),
        
        Chord(name: "Em", time: 4), // 4 seconds
        Chord(name: "D", time: 8), // 8 seconds
        Chord(name: "C", time: 12), // 12 seconds
        Chord(name: "G", time: 16), // 16 seconds
        Chord(name: "Em", time: 20), // 20 seconds
        Chord(name: "D", time: 24), // 24 seconds
        Chord(name: "C", time: 28), // 28 seconds
    ]
    @State private var offset: CGFloat = 0
    @State private var contentWidth: CGFloat = 0
    @State private var viewLoaded: Bool = false
    var fretViewWidth: CGFloat = 300
    var desiredDuration: Double = 2
    var speed: Double = 0.01 // This is the time interval for the timer, in seconds
    private var scrollSpeed: CGFloat {
        fretViewWidth / CGFloat(desiredDuration / speed)
    }
    private var getFretBoardLong: Int {
        return Int(ceil(Double(chords.last!.time) / 2.0 + 15.0))
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
                                    startAnimation()
                                }
                            }
                        }
                    )
                    .offset(x: offset)
                }
                .frame(width: geometry.size.width, alignment: .leading)
            }
            
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.blue)
                    .frame(width: 8, height: 300)
                    .offset(x: -300)
            )
        }
        .frame(maxHeight: .infinity)
        .background(Color.purple)
        
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            offset -= scrollSpeed
            if offset <= -contentWidth {
                offset = 0
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
                .fill(Color.white)
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
        if index == 1 {
            return chords.filter { Double(index) - 1 <= $0.time && $0.time < Double(index + 1) }
        }
        return chords.filter { Double(index) < $0.time && $0.time < Double(index + 2) }
    }
}

struct ChordView: View {
    var chord: Chord
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 64, height: 250)
                .cornerRadius(10)
                .overlay {
                    Text("\(chord.name) ")
                }
        }.frame(height: 250)
            .offset(x:CGFloat(getChordOffset()))
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
            .padding(.vertical, 20)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FretboardView()
}
