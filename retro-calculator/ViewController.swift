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

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningSum: String = ""
    var leftValueNumber: String = ""
    var rightValueNumber: String = ""
    var currentOperation: Operation = Operation.Empty
    
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
        
        runningSum += "\(btn.tag)"
        
        outputLbl.text = runningSum
        
        
        
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        
    }

}

