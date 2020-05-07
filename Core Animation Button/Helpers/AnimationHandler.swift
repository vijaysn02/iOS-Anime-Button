//
//  AnimationHandler.swift
//  Core Animation Button
//
//  Created by TPFLAP146 on 07/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Animation
class Animation {
    
    static func animateButton(button:UIButton,viewController:UIViewController,duration: CFTimeInterval,newButtonWidth:CGFloat) {
        
        //1 -Setting Up the Position
        let oldPosition = button.frame.width/2
        
        //2 -Forms a Bézier curve with given points
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55)
        

        CATransaction.begin()
        
        //3 -Setting the Animation Properties in Presentation Layer
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(timingFunction)

        //4 - View animations
        UIView.animate(withDuration: duration) {
            button.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            button.center = viewController.view.center
        }
        
        //5 -Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = oldPosition
        cornerAnimation.toValue = newButtonWidth/2
        
        button.layer.cornerRadius = newButtonWidth/2
        button.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
        
        
        CATransaction.commit()
        
    }
    
}
