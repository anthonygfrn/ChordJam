//
//  ChordModel.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 23/06/24.
//

import Foundation

enum ChordType: String {
    case D = "D"
    case E = "E"
    case A = "A"
    case G = "G"
    case C = "C"
    case Dm = "Dm"
}

struct ChordModel: Identifiable {
    let id = UUID()
    let chord: ChordType
    let lyric: String
    let time: TimeInterval
}
