//
//  ViewController.swift
//  API Master
//
//  Created by TPFLAP146 on 03/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import UIKit

//MARK: - View Controller - Initialization
class ViewController: UIViewController {
    
    //Outlet - Button
    var animationButton: UIButton!
    
    //Variables
    var bigBallWidth:CGFloat = 125
    var smallBallWidth:CGFloat = 60
    var ballWidth:CGFloat = 125
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialButtonSetup()
    }
    
}

//MARK: - Initial View - Button Setup
extension ViewController  {
    
    func initialButtonSetup() {

        animationButton = UIButton(frame: CGRect(x: 0, y: 0, width: ballWidth, height: ballWidth))
        animationButton.backgroundColor = .red
        animationButton.layer.cornerRadius = animationButton.frame.width/2
        animationButton.center = self.view.center
        
        self.view.addSubview(animationButton)
        buttonActionSetup()
        
    }
    func buttonActionSetup() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        animationButton.isUserInteractionEnabled = true
        animationButton.addGestureRecognizer(tap)
    }
    @objc func tapAction() {
        animateButton()
    }
    
}

//MARK: - Button Animation
extension ViewController {
    
    func animateButton(duration: CFTimeInterval = 1.5) {
        
        var newButtonWidth = smallBallWidth
       
        //Change the ball dimensions
        if !isExpanded {
            newButtonWidth = smallBallWidth
        } else {
            newButtonWidth = bigBallWidth
        }
        
        //Calling the Animation
        Animation.animateButton(button: animationButton, viewController: self, duration: duration, newButtonWidth: newButtonWidth)
        
        //Restoring the State
        if !isExpanded {
            ballWidth = smallBallWidth
            isExpanded = true
        } else {
            ballWidth = bigBallWidth
            isExpanded = false
        }
    }
    
    
    
}
