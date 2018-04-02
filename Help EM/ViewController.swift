//
//  ViewController.swift
//  Help EM
//
//  Created by John Gallaugher on 3/26/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var blastOffButton: UIButton!
    
    var imageNumber = 0
    var numberOfImages = 5
    var yAtStart: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yAtStart = rocketImage.frame.origin.y
    }

    @IBAction func rocketTapped(_ sender: UITapGestureRecognizer) {
        imageNumber += 1
        if imageNumber >= numberOfImages {
            imageNumber = 0
        }
        
        rocketImage.image = UIImage(named: "rocket\(imageNumber)")
    }
    
    @IBAction func blastOffPressed(_ sender: UIButton) {
        if rocketImage.frame.origin.y < 0 {
            UIView.animate(withDuration: 2, animations: { self.rocketImage.frame.origin.y = self.yAtStart })
            blastOffButton.setTitle("Blast Off!", for: .normal)
        } else {
             UIView.animate(withDuration: 2, animations: { self.rocketImage.frame.origin.y = -(self.rocketImage.frame.height) })
            blastOffButton.setTitle("Return", for: .normal)
        }
       
    }
}

