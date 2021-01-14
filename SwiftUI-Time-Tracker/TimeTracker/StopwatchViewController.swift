//
//  StopwatchViewController.swift
//  TimeTracker
//
//  Created by João Gabriel Pozzobon dos Santos on 13/05/19.
//  Copyright © 2019 João Gabriel Pozzobon dos Santos. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Reset: UIButton!
    
    let bodyFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.body)
    
    var time = 0
    var timer: Timer?
    
    var backgroundTime: Date?
    var correctTime = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bodyMonospacedNumbersFontDescriptor = bodyFontDescriptor.addingAttributes(
            [
                UIFontDescriptor.AttributeName.featureSettings: [
                    [
                        UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                        UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
                    ]
                ]
            ])
        
        Label.font = UIFont(descriptor: bodyMonospacedNumbersFontDescriptor, size: 65.0)
        Label.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func TriggerStopwatch(_ sender: Any) {
        if Button.currentTitle! == "Start" {
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(IncrementTime), userInfo: nil, repeats: true)
            
            Button.setTitle("Stop", for: .normal)
            Button.setTitleColor(.red, for: .normal)
            
            Reset.isEnabled = false
            Reset.setTitleColor(.lightGray, for: .normal)
            
            correctTime = true
        } else if Button.currentTitle! == "Stop" {
            timer?.invalidate()
            Button.setTitle("Start", for: .normal)
            Button.setTitleColor(UIColor(displayP3Red: 0, green: 196/255, blue: 14/255, alpha: 1), for: .normal)
            
            Reset.isEnabled = true
            Reset.setTitleColor(.darkGray, for: .normal)
            
            correctTime = false
        }
    }
    
    @IBAction func ResetStopwatch(_ sender: Any) {
        time = 0
        Label.text = MillisToString(time)
        
        Button.setTitle("Start", for: .normal)
        Button.setTitleColor(UIColor(displayP3Red: 0, green: 196/255, blue: 14/255, alpha: 1), for: .normal)
        
        Reset.isEnabled = false
        Reset.setTitleColor(.lightGray, for: .normal)
    }
    
    @objc func IncrementTime() {
        time += 1
        Label.text = MillisToString(time)
    }
    
    func MillisToString(_ millis: Int) -> String {
        var milliseconds = millis
        var seconds = milliseconds/1000
        var minutes = seconds/60
        let hours = minutes/60
        
        milliseconds = milliseconds%1000
        seconds = seconds%60
        minutes = minutes%60
        
        var text = String(format: "%02d", minutes)+":"+String(format: "%02d", seconds)+"."+String(format: "%02d", Int(Double(milliseconds/10).rounded()))
        
        if hours >= 1 {
            text = String(format: "%02d", hours)+":"+text
        }
        
        return text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: Selector(("activeAgain")), name: NSNotification.Name(rawValue: "UIApplicationDidBecomeActiveNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector(("goingAway")), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: nil)
    }
    
    @objc func goingAway() {
        backgroundTime = Date()
    }
    
    @objc func activeAgain() {
        if (correctTime) {
            time += Int(Date().timeIntervalSince1970 * 1000.0.rounded() - backgroundTime!.timeIntervalSince1970 * 1000.0.rounded())
            Label.text = MillisToString(time)
        }
    }
}

