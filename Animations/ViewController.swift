//
//  ViewController.swift
//  Animations
//
//  Created by Ramazan Abdullayev on 1/17/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    var num = 0
    
    var isAnimating = false
    
    var timer = Timer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            buttonLabel.setTitle("Start", for:[])
            
            isAnimating = false
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            buttonLabel.setTitle("Stop", for: [])
            
            isAnimating = true
            
        }
        
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1) {
            
            self.image.alpha = 1
        
        }
        
    }
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
        }
        
    }
    
    @IBAction func growIn(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
        }
        
    }
    
    
    @objc func animate() {
        
        if num < 10 {
            
            image.image = UIImage(named: "frame_0\(num)_delay-0.1s.gif")
            
        } else if num == 10 {
            
            image.image = UIImage(named: "frame_\(num)_delay-0.1s.gif")
            
        }
        
        if num == 10 {
            
            num = 0
            
        }
        
        num += 1
        
    }
    
}
