//
//  ViewController.swift
//  BullsEye
//
//  Created by Ray Wenderlich on 6/13/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetScore: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    let roundedValue = slider.value.rounded()
    currentValue = Int(roundedValue)
    startNewRound()
    roundLabel.text = String(round)
        
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
    let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
    let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  }
  
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    
    if(difference == 0) {
     points += 100 // bonus points
    } else if(difference == 1) {
        points += 50
    }
    score += points
    
    let title: String
    if difference == 0 {
        title = "Perfect!!!"
    } else if difference < 5 {
        title = "You almost had it!"
    } else if difference < 10 {
        title = "Pretty good!"
    } else {
        title = "Not even close. 😞"
    }
    let message = "You scored \(points) points."
    
    ///////// modal
    let alert = UIAlertController(title: "Slider is now: \(currentValue)", message: message, preferredStyle: .alert)
        // alert pops up in the direct middle
        // action sheet slides up from the bottom
    
    // this is a closure - only runs when the button on the alert is tapped
    let action = UIAlertAction(title: title, style: .default, handler: {
        action in
        self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    //////// end of modal
    
  }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func restartTapped(_ sender: Any) {
        currentValue = 0
        targetValue = 0
        score = 0
        round = 1
        updateLabels()
    }
    
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100) // random number between 1 and 100
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        targetScore.text = String(targetValue)
        roundLabel.text = String(round)
        scoreLabel.text = "\(score)"
    }
//    @IBAction func knockKnock(_ sender: Any) {
//        let knockKnock = UIAlertController(title: "Knock Knock!", message: "Who's there?", preferredStyle: .actionSheet)
//        
//        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
//        
//        knockKnock.addAction(action)
//        present(knockKnock, animated: true, completion: nil)
//    }
}

