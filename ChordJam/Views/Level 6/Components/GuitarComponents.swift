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
    
    func getChords(index: Int) -> [ChordModel] {
        let startTime = Double((index - 2) * 2)
        let endTime = startTime + 2
        return chords.filter { startTime <= $0.time && $0.time < endTime }
    }
}

struct ChordView: View {
    var chord: ChordModel
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
                        Text("\(chord.chord)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
        }.frame(height: 210, alignment: .top)
            .offset(x:CGFloat(getChordOffset()))
            .onReceive(timer) { _ in
                print("\(timer)")
                if self.chord.time < Date().timeIntervalSince1970 {
                    self.timePassed = true
                }
            }
    }
    
    // 3 120
    // 4 130
    // 5 170
    // 6 210
    
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
