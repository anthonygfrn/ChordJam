//
//  FretView.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 23/06/24.
//

import Foundation
import SwiftUI

struct FretView: View {
    var index: Int
    var chords: [ChordModel]
    
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
    var chords: [ChordModel]
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(.white)
                .frame(width: 0.5, height: 250)
            ZStack{
                ForEach(getChords(index: index)) { chord in
                    ChordView(chord: chord)
                }
            }
            Spacer()
        }
    }
    
    func getChords(index: Int) -> [ChordModel] {
        let startTime = Double((index - 2) * 2)
        let endTime = startTime + 2
        return chords.filter { startTime <= $0.time && $0.time < endTime }
    }
}

struct ChordView: View {
    var chord: ChordModel
    @EnvironmentObject var viewModel: Level6ViewModel
    @EnvironmentObject var manager: chordModel
    @State private var chordConditional = ChordConditionalType.none
    //    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(getChordColor())
                .frame(width: 64, height: CGFloat(getChordHeight()), alignment: .top)
                .cornerRadius(10)
                .overlay {
                    VStack(alignment: .center){
                        Text("\(chord.chord.rawValue)")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                    }
                }
        }.frame(height: 210, alignment: .top)
            .offset(x:CGFloat(getChordOffset()))
            .onReceive(viewModel.$currentTime, perform: { time in
                if chordConditional != ChordConditionalType.none {
                    return
                }
                let expectedChord = chord.chord.rawValue
                let detectedChord = manager.predictionResult
                
                if time >= (chord.time ) && time <= (chord.time + 1) {
                    print(time, chord.time)
                    print("Detected Chord \(detectedChord), Expected Chord: \(expectedChord)")
                    if detectedChord == expectedChord {
                        print("Correct")
                        chordConditional = ChordConditionalType.correct
                    } else {
                        print("False")
                        chordConditional = ChordConditionalType.inCorrect
                        viewModel.pauseMusic()
                    }
                }
                
            })
            .onReceive(manager.$predictionResult, perform: { result in
                if chordConditional == ChordConditionalType.inCorrect {
                    let expectedChord = chord.chord.rawValue
                    let detectedChord = manager.predictionResult
                    
                    print(time, chord.time)
                    print("Detected Chord \(detectedChord), Expected Chord: \(expectedChord)")
                    if detectedChord == expectedChord {
                        print("Correct")
                        chordConditional = ChordConditionalType.correct
                        viewModel.restartMusic()
                    } else {
                        print("False")
                    }
                }
            })
        
    }
    
    // 3 120
    // 4 130
    // 5 170
    // 6 210
    
    func getChordColor() -> Color {
        return switch chordConditional {
        case .none:
            Color(.accent)
        case .correct:
            Color(.green)
        case .inCorrect:
            Color(.red)
        }}
    
    func getChordHeight() -> Int {
        switch(chord.chord){
        case .D:
            130
        case .E:
            210
        case .A:
            130
        case .G:
            210
        case .C:
            170
        case .Dm:
            130
        case .Am:
            170
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
