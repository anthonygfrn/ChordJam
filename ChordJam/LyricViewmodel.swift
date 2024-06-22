//
//  LyricViewmodel.swift
//  ChordJam
//
//  Created by Rifat Khadafy on 21/06/24.
//

import Foundation
import Combine
import AVFoundation

struct LyricLine {
    let text: String
    let time: TimeInterval
}

class LyricsProvider {
    let lyrics: [LyricLine]
    
    init() {
        self.lyrics = [
            LyricLine(text: "Almost heaven, West Virginia", time: 0),
            LyricLine(text: "Blue Ridge Mountains, Shenandoah River", time: 5),
            LyricLine(text: "Life is old there, older than the trees", time: 10),
            LyricLine(text: "Younger than the mountains, blowing like a breeze", time: 15),
            LyricLine(text: "Country roads, take me home", time: 20),
            LyricLine(text: "To the place I belong", time: 25),
            LyricLine(text: "West Virginia, mountain mama", time: 30),
            LyricLine(text: "Take me home, country roads", time: 35),
            LyricLine(text: "All my memories gather round her", time: 40),
            LyricLine(text: "Miner's lady, stranger to blue water", time: 45),
            LyricLine(text: "Dark and dusty, painted on the sky", time: 50),
            LyricLine(text: "Misty taste of moonshine, teardrop in my eye", time: 55),
            LyricLine(text: "Country roads, take me home", time: 60),
            LyricLine(text: "To the place I belong", time: 65),
            LyricLine(text: "West Virginia, mountain mama", time: 70),
            LyricLine(text: "Take me home, country roads", time: 75)
        ]
    }
}


class LyricsViewModel: ObservableObject {
    @Published var currentLyric: String = ""
    private var lyrics: [LyricLine]
    private var currentIndex: Int = 0
    private var timer: AnyCancellable?
    private var audioPlayer: AVAudioPlayer!
    
    init(lyricsProvider: LyricsProvider) {
        self.lyrics = lyricsProvider.lyrics
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
            print("Start Audio")
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error loading audio file")
        }
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
