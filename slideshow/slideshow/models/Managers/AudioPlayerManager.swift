//
//  AudioPlayerManager.swift
//  SlideShow
//
//  Created by Andrey on 18.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit
import AVFoundation

final class AudioPlayerManager: NSObject {
    
    //MARK: - Property
    
    var audioPlayer = AVAudioPlayer()
    
    //MARK: - Initialization
    
    static let shared = AudioPlayerManager()
    private override init() {}
    
    //MARK: - Functions
    
    public func setSound(_ name: String, _ type: String, _ infinity: Bool) {
        do {
            let file = Bundle.main.path(forResource: name, ofType: type)
            let url = URL(fileURLWithPath: file!)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = infinity ? -1 : 0
            audioPlayer.play()
        } catch {print(error.localizedDescription)}
    }
}
