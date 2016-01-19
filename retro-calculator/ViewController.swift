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
    
    var runningSum: String = ""
    var leftValueNumber: String = ""
    var rightValueNumber: String = ""
    var currentOperation: Operation = Operation.Empty
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
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
        
        playSound()
        
        runningSum += "\(btn.tag)"
        outputLbl.text = runningSum
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(operationToDo: Operation) {
        
        playSound()
        
        
        
        
        if currentOperation != Operation.Empty {
           runningSum = leftValueNumber currentOperation.rawValue runningSum
        } else {
            leftValueNumber = runningSum
            runningSum = ""
            currentOperation = operationToDo
        }
    
    }
    
    func playSound() {
        buttonSound.play()
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
    }

}

