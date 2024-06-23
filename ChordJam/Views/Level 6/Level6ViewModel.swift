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
        ChordModel(chord: ChordType.A, time: 0),
        ChordModel(chord: ChordType.A, time: 0.5),
        ChordModel(chord: ChordType.A, time: 1),
        ChordModel(chord: ChordType.A, time: 5),
        ChordModel(chord: ChordType.A, time: 10),
        ChordModel(chord: ChordType.A, time: 15),
        ChordModel(chord: ChordType.A, time: 20),
        ChordModel(chord: ChordType.A, time: 25),
        ChordModel(chord: ChordType.A, time: 30),
        ChordModel(chord: ChordType.A, time: 35),
    ]
    
    let lyrics: [LyricModel] = [
        LyricModel(text: "Almost heaven, West Virginia", time: 0),
        LyricModel( text: "Blue Ridge Mountains, Shenandoah River", time: 5),
        LyricModel( text: "Life is old there, older than the trees", time: 10),
        LyricModel( text: "Younger than the mountains, blowing like a breeze", time: 15),
        LyricModel( text: "Country roads, take me home", time: 20),
        LyricModel( text: "To the place I belong", time: 25),
        LyricModel( text: "West Virginia, mountain mama", time: 30),
        LyricModel( text: "Take me home, country roads", time: 35),
    ]
    private var currentIndex: Int = 0
    private var timer: AnyCancellable?
    private var audioPlayer: AVAudioPlayer!
    
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
        updateLyric()
    }
    
    private func startAudio() {
        guard let path = Bundle.main.path(forResource: "JohnDenver-TakeMeHomeCountryRoad", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error loading audio file")
        }
    }
    
    func stopMusic() {
        audioPlayer.stop()
    }
    
    private func updateLyric() {
        guard currentIndex < lyrics.count else { return }
        
        let lyricLine = lyrics[currentIndex]
        currentLyric = lyricLine.text
        
        if currentIndex < lyrics.count - 1 {
            let nextLine = lyrics[currentIndex + 1]
            let timeInterval = nextLine.time - lyricLine.time
            
            timer = Timer.publish(every: timeInterval, on: .main, in: .default).autoconnect()
                .sink { [weak self] _ in
                    self?.timer?.cancel()
                    self?.updateLyric()
                }
        }
        
        currentIndex += 1
    }
}
