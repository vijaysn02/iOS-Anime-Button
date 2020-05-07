# Animation Button

## Introduction:

This project is created to understand the working of Animation Button and also to have a ready made component for integration in the projects. 

If you want to implement it straight away, you can make copy the handler in the project and jump to the Usage part.

---------------------------------------------------------------------------------------------------

## Installation:

There is no specific installation needed for this implementation.


----------------------------------------------------------------------------------------------------

## Configuration:

 There is no specific configuration needed for this implementation.

----------------------------------------------------------------------------------------------------

## Coding Part - Handler:

### Animate Button

```
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
```

----------------------------------------------------------------------------------------------------

## Usage Part

### Invoke the below specific function to use in your View Controller. 

```
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
```


### Check out my Post about Animation Button : [Animation Button](https://vijaysn.com/2020/04/23/ios-av-player/)
