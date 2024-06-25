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
        ChordModel(chord: ChordType.C, time: 13),
        ChordModel(chord: ChordType.C, time: 13.5),
        ChordModel(chord: ChordType.C, time: 14),
        ChordModel(chord: ChordType.C, time: 14.5),
        ChordModel(chord: ChordType.C, time: 15),
        ChordModel(chord: ChordType.C, time: 15.5),
        ChordModel(chord: ChordType.C, time: 16), // 26.5
        ChordModel(chord: ChordType.C, time: 16.5),
        ChordModel(chord: ChordType.C, time: 17),
        ChordModel(chord: ChordType.Am, time: 45.5),
        ChordModel(chord: ChordType.Dm, time: 51.5),
        ChordModel(chord: ChordType.G, time: 58),
        ChordModel(chord: ChordType.C, time: 70),
        ChordModel(chord: ChordType.Dm, time: 75.5), // 76
        ChordModel(chord: ChordType.C, time: 80.5),
        ChordModel(chord: ChordType.Dm, time: 85),
    ]
    
//    ChordModel(chord: ChordType.C, time: 14),
//    ChordModel(chord: ChordType.Am, time: 20.5),
//    ChordModel(chord: ChordType.Dm, time: 26.5), // 26.5
//    ChordModel(chord: ChordType.G, time: 33),
//    ChordModel(chord: ChordType.C, time: 39),
//    ChordModel(chord: ChordType.Am, time: 45.5),
//    ChordModel(chord: ChordType.Dm, time: 51.5),
//    ChordModel(chord: ChordType.G, time: 58),
//    ChordModel(chord: ChordType.C, time: 70),
//    ChordModel(chord: ChordType.Dm, time: 75.5), // 76
//    ChordModel(chord: ChordType.C, time: 80.5),
//    ChordModel(chord: ChordType.Dm, time: 85),
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
        LyricModel(text: "♪", time: 86),
    ]
    private var currentIndex: Int = 0
    private var timer: AnyCancellable?
    private var timer2: AnyCancellable?
    private var audioPlayer: AVAudioPlayer!
    @Published var currentTime: Double = 0
    
    init() {
        setupAudioSession()
    }
    
    func setupAudioSession() {
        do {
            // Set the audio session category to playback
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
    }
    
    func startLyrics() {
        guard !lyrics.isEmpty else { return }
        startAudio()
    }
    
    private func startAudio() {
        guard let path = Bundle.main.path(forResource: "grikfrik", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect().sink { [weak self] _ in
                self?.updateCurrentTime()
            }
        } catch {
            print("Error loading audio file")
        }
    }
    
    func updateCurrentTime() {
        currentTime = audioPlayer?.currentTime ?? 0
        updateLyricBasedOnCurrentTime()
    }
    
    func stopMusic() {
        audioPlayer.stop()
        timer?.cancel()
    }
    
    private func updateLyricBasedOnCurrentTime() {
        // Check if the current index is within the bounds of the lyrics array
        if(currentTime > (lyrics.last?.time ?? 0 ) + 2 ){
            stopMusic()
        }
        guard currentIndex < lyrics.count else {return}
        
        // If the current time is greater than the next lyric's time, update the current index and lyric
        if currentTime >= lyrics[currentIndex].time {
            currentLyric = lyrics[currentIndex].text
            currentIndex += 1
        }
        
        
    }
    
    
    
}
