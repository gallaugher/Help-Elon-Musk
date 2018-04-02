//
//  ViewController.swift
//  Help EM
//
//  Created by John Gallaugher on 3/26/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var blastOffButton: UIButton!
    
    var imageNumber = 0
    var numberOfImages = 5
    var yAtStart: CGFloat = 0
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yAtStart = rocketImage.frame.origin.y
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be palyed as an audio file")
            }
            
        } else {
            print("ERROR: could not load from file \(soundName)")
        }
    }
    
    func moveRocket() {
        playSound(soundName: "rocketsound", audioPlayer: &audioPlayer)
        if rocketImage.frame.origin.y < 0 {
            
            UIView.animate(withDuration: 2, animations: { self.rocketImage.frame.origin.y = self.yAtStart }) { _ in
                self.audioPlayer.stop()
            }
            
            blastOffButton.setTitle("Blast Off!", for: .normal)
        } else {
            
            UIView.animate(withDuration: 2, animations: { self.rocketImage.frame.origin.y = -(self.rocketImage.frame.height) }) { _ in
                self.audioPlayer.stop()
            }
            
            blastOffButton.setTitle("Return", for: .normal)
        }
    }

    @IBAction func rocketTapped(_ sender: UITapGestureRecognizer) {
        imageNumber += 1
        if imageNumber >= numberOfImages {
            imageNumber = 0
        }
        
        rocketImage.image = UIImage(named: "rocket\(imageNumber)")
    }
    
    @IBAction func rocketSwiped(_ sender: UISwipeGestureRecognizer) {
        moveRocket()
    }
    
    @IBAction func blastOffPressed(_ sender: UIButton) {
        moveRocket()
    }
}

