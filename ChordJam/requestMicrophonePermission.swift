//
//  requestMicrophonePermission.swift
//  ChordJam
//
//  Created by Anthony on 23/06/24.
//

import AVFoundation

func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
    AVAudioSession.sharedInstance().requestRecordPermission { allowed in
        DispatchQueue.main.async { // Ensure UI updates are on the main thread
            completion(allowed)
        }
    }
}
