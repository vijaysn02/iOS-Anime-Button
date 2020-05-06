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

//MARK: - Initial View Setup
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
    
    fileprivate func animateButton(duration: CFTimeInterval = 1.0) {
        
        //Defining the Model properties
        let oldValue = animationButton.frame.width/2
        var newButtonWidth = smallBallWidth
       
        //Change the ball dimensions
        if !isExpanded {
            newButtonWidth = smallBallWidth
        } else {
            newButtonWidth = bigBallWidth
        }
        
        //Forms a Bézier curve with given points
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55)
        

        CATransaction.begin()
        
        //Setting the Animation Properties in Presentation Layer
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(timingFunction)

        //View animations
        UIView.animate(withDuration: duration) {
            self.animationButton.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            self.animationButton.center = self.view.center
        }
        
        //Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = oldValue
        cornerAnimation.toValue = newButtonWidth/2
        
        animationButton.layer.cornerRadius = newButtonWidth/2
        animationButton.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
        
        //Switching the mode
        if !isExpanded {
            ballWidth = smallBallWidth
            isExpanded = true
        } else {
            ballWidth = bigBallWidth
            isExpanded = false
        }
        
        CATransaction.commit()
    }
    
}
