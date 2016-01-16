//
//  ViewController.swift
//  tapper-app
//
//  Created by Dmitry Medvedev on 16/01/16.
//  Copyright © 2016 Dmitry Medvedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var maxTaps = 0
    var currentTaps = 0
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var tapsText: UITextField!
    
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tapsText.delegate = self
    }
    
    
    @IBAction func onPlayButtonClick (sender: UIButton){
        
        if tapsText.text != nil && tapsText.text != ""{
            logoImage.hidden = true
            playButton.hidden = true
            tapsText.hidden = true
            
            starButton.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(tapsText.text!)!
            currentTaps = 0
            updateTaps()
        }
    }
    
    @IBAction func onStarButton (sender: UIButton){
        
        currentTaps++;
        updateTaps()
        
        if currentTaps >= maxTaps{
            maxTaps = 0
            logoImage.hidden = false
            playButton.hidden = false
            tapsText.hidden = false
            
            starButton.hidden = true
            tapsLabel.hidden = true
            
            tapsText.text = ""
        }
    }
    
    func updateTaps (){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    

}
