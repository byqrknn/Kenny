//
//  ViewController.swift
//  kenny yakala oyunu
//
//  Created by GÜRKAN ÜNAL on 1.05.2020.
//  Copyright © 2020 GÜRKAN ÜNAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var Hidetimer = Timer()
    var counter = 0
    var count1 = 1
    var kennyarray = [UIImageView]()
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var HscoreLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 25
        count1 = 1
        
        let StoredHscore = UserDefaults.standard.object(forKey: "score")
        if let NewScore = StoredHscore as? String {
            HscoreLabel.text = "HighScore : \(NewScore)"
        }
        
        timeLabel.text = "Time : \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        Hidetimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(Hidekenny), userInfo: nil, repeats: true)
        kenny1.isUserInteractionEnabled = true
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny1.addGestureRecognizer(gestureRecognizer)
        kenny2.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny2.addGestureRecognizer(gestureRecognizer)
        kenny3.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny3.addGestureRecognizer(gestureRecognizer)
        kenny4.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny4.addGestureRecognizer(gestureRecognizer)
        kenny5.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny5.addGestureRecognizer(gestureRecognizer)
        kenny6.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny6.addGestureRecognizer(gestureRecognizer)
        kenny7.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny7.addGestureRecognizer(gestureRecognizer)
        kenny8.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny8.addGestureRecognizer(gestureRecognizer)
        kenny9.isUserInteractionEnabled = true
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scorefunc))
        kenny9.addGestureRecognizer(gestureRecognizer)
        
        kennyarray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        
    }
    @objc func timeFunc () {
        timeLabel.text = String(counter)
        counter -= 1
        if counter == 0 {
            timeLabel.text = "Time Over"
            MyAlert()
            timer.invalidate()
            Hidetimer.invalidate()
            HscoreLabel.text = String(count1)
            UserDefaults.standard.set(HscoreLabel.text, forKey: "score")
            HscoreLabel.text = "High Score : \(count1)"
            }
        }
  func MyAlert () {
        let alert  = UIAlertController(title: "Time OUT", message: "Are You Ready", preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "NO", style: UIAlertActionStyle.default) { (UIAlertAction) in}
    let ReplayButton = UIAlertAction(title: "Replay", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
        self.score = 0
        self.scoreLabel.text = "Score : \(self.counter)"
        self.counter = 15
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeFunc), userInfo: nil, repeats: true)
        self.Hidetimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.Hidekenny), userInfo: nil, repeats: true)
        
        
    }
        alert.addAction(okButton)
        alert.addAction(ReplayButton)
        self.present(alert, animated: true, completion: nil)
        }
    @objc func scorefunc (){
      
        scoreLabel.text = "Score : \(count1)"
        count1 += 1
       
    }
    @objc func Hidekenny() {
        
        for kenny in kennyarray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyarray.count - 1)))
        kennyarray[random].isHidden = false
    }
    
        
    
    
    
    
    
}

