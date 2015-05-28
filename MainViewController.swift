//
//  MainViewController.swift
//  TinderCloneRedux
//
//  Created by Frank Desimini on 2015-05-27.
//  Copyright (c) 2015 Eff Dee Productions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var xFromCenter:CGFloat = 0
    var label:UILabel!
    var imageView:UIImageView!
    
    var newColour = UIColor(red: 242/255, green: 238/255, blue: 135/255, alpha: 1.0)
    
//    // set background colour
//    self.backgroundColor = newColour
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // set background colour
        self.view.backgroundColor = newColour
        
        // Do any additional setup after loading the view.
        
        imageView = UIImageView(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 100, 200, 200))
        //default image for our user
        imageView.image = UIImage(named: "Mario")
        // add a corner radius to our image
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .blueColor()
        self.view.addSubview(imageView)
        
        //Gesture recognizer
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        imageView.addGestureRecognizer(gesture)
        imageView.userInteractionEnabled = true
        
        
        
    }
    
    func wasDragged(gesture:UIPanGestureRecognizer){
        let translation = gesture.translationInView(self.view)
        //Get what has been dragged
        var profile = gesture.view!
        xFromCenter += translation.x
        //scaling happening on swipe
        var scale = min(100 / abs(xFromCenter), 1)
        profile.center = CGPoint(x: profile.center.x + translation.x, y: profile.center.y + translation.y)
        // reset translation
        gesture.setTranslation(CGPointZero, inView: self.view)
        // rotate the label/image
        var rotation:CGAffineTransform = CGAffineTransformMakeRotation(translation.x / 200)
        // stretch the view - see Twitter bird animation on load of twitter app
        var stretch:CGAffineTransform = CGAffineTransformScale(rotation, scale, scale)
        //        // stetch the image/label
        //        label.transform = stretch
        // define whether or not someone is chosen
        if profile.center.x < 100 {
            println("Not chosen")
            //do nothing
        } else {
            println("Chosen")
            // we could add chosen user to parse
        }
        
        // when the gesture state has ended
        if gesture.state == UIGestureRecognizerState.Ended {
            // set the label/image back
            profile.center = CGPointMake(view.bounds.width / 2 , view.bounds.height / 2)
            // undo scale
            scale = max(abs(xFromCenter) / 100, 1)
            // undo rotation
            rotation = CGAffineTransformMakeRotation(0)
            //            // stretch the current view
            //            stretch = CGAffineTransformScale(rotation, scale, scale)
            // set the image or label back to original size after scaling
            imageView.frame = CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 100, 200, 200)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
