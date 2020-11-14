//
//  ViewController.swift
//  beRUPU Audio Player
//
//  Created by be RUPU on 14/11/20.
//  Copyright © 2020 be RUPU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "audio", ofType: "mp3")
    var timer = Timer()
    
    @IBOutlet var volume: UISlider!
    @IBOutlet var scrubller: UISlider!
    @IBOutlet var pause: UIButton!
    @IBOutlet var play: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        play.layer.cornerRadius  = 25.0
        pause.layer.cornerRadius = 25.0
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubller.maximumValue = Float(player.duration)
            
        }catch {
            print("Error Playing Audio\(error)")
        }
        
    }
    
    @objc func updateScrubller(){
        scrubller.value = Float(player.currentTime)
    }

    @IBAction func playButton(_ sender: Any) {
        player.play()
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(updateScrubller), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBAction func scrubllerChange(_ sender: Any) {
        player.currentTime = TimeInterval(scrubller.value)
    }
    
    @IBAction func volumeChange(_ sender: Any) {
        player.volume = volume.value
    }
    
    
}

