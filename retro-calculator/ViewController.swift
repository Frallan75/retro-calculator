//
//  ViewController.swift
//  retro-calculator
//
//  Created by Francisco Claret on 18/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let audioPathURL: NSURL = NSURL(fileURLWithPath: audioPath!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: audioPathURL)
            buttonSound?.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func numberPressed(btn: UIButton) {
        buttonSound.play()
        
    }

}

