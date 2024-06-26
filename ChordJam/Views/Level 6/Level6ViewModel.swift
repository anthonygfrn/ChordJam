//
//  Level6ViewModel.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 23/06/24.
//

import Foundation
import AVFoundation
import Combine


class Level6ViewModel: ObservableObject {
    @Published var currentLyric: String = ""
    @Published var offset: CGFloat = 122
    
    let chords: [ChordModel] = [
        ChordModel(chord: ChordType.C, time: 14),
        ChordModel(chord: ChordType.Am, time: 20.5),
        ChordModel(chord: ChordType.Dm, time: 26.5), // 26.5
        ChordModel(chord: ChordType.G, time: 33),
        ChordModel(chord: ChordType.C, time: 39),
        ChordModel(chord: ChordType.Am, time: 45.5),
        ChordModel(chord: ChordType.Dm, time: 51.5),
        ChordModel(chord: ChordType.G, time: 58),
        ChordModel(chord: ChordType.C, time: 70),
        ChordModel(chord: ChordType.Dm, time: 75.5), // 76
        ChordModel(chord: ChordType.C, time: 80.5),
        ChordModel(chord: ChordType.Dm, time: 85),
    ]
    
    let lyrics: [LyricModel] = [
        LyricModel(text: "You know I can't smile without you", time: 11),
        LyricModel(text: "I can't smile without you", time: 20 ),
        LyricModel(text: "I can't laugh and I can't sing", time: 25.5),
        LyricModel(text: "I'm finding it hard to do anything", time: 31.8),
        LyricModel(text: "You see, I feel sad when you're sad", time: 37.8),
        LyricModel(text: "I feel glad when you're glad", time: 45),
        LyricModel(text: "If you only knew what I'm going through", time: 51),
        LyricModel(text: "I just can't smile without you", time: 58),
        LyricModel(text: "♪", time: 65),
        LyricModel(text: "You came along just like a song", time: 69),
        LyricModel(text: "And brighten my day", time: 75.8),
        LyricModel(text: "Who would have believed that you were part of a dream", time: 79),
        LyricModel(text: "Now it all seems light years away", time: 84.8),
        LyricModel(text: "♪", time: 88),
    ]
    private var currentIndex: Int = 0
    private var timer: Timer?

    private var audioPlayer: AVAudioPlayer!
    @Published var currentTime: Double = 0
    @Published var chordImage: ChordType?
        
    func startLyrics() {
        guard !lyrics.isEmpty else { return }
        startAudio()
    }
    
    func startTimerAgain() {
        audioPlayer?.currentTime = currentTime
        audioPlayer?.play()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
            self.currentTime += 0.01
            self.updateLyricBasedOnCurrentTime()
        }
    }
    
    private func startAudio() {
        guard let path = Bundle.main.path(forResource: "grikfrik", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in 
                self.currentTime += 0.01
                self.updateLyricBasedOnCurrentTime()
            }
            
        } catch {
            print("Error loading audio file")
        }
    }
    
    
    func pauseTimer(){
        audioPlayer.pause() 
        timer?.invalidate()
    }
    
    
    func stopMusic() {
        audioPlayer.stop()
        timer?.invalidate()
    }
    
    func getClosestChord(at time: Double) -> ChordType? {
        for chord in chords {
            if time <= chord.time + 0.3 {
                return chord.chord
            }
        }
        return chords.last?.chord
    }
    
    private func updateLyricBasedOnCurrentTime() {
        // Check if the current index is within the bounds of the lyrics array
    
        guard currentIndex < lyrics.count else {
            if(currentTime > (lyrics.last?.time ?? 0 ) + 2 ){
                stopMusic()
            }
            return
        }
        
        let closestChord = getClosestChord(at: currentTime)
        if closestChord != self.chordImage && closestChord != nil {
            self.chordImage = closestChord!
        }
        
        // If the current time is greater than the next lyric's time, update the current index and lyric
        if currentTime >= lyrics[currentIndex].time {
            currentLyric = lyrics[currentIndex].text
            currentIndex += 1
        }
        
        
    }
    
    
    
}
