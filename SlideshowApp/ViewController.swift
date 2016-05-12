//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Masamichi Ebata on 2016/05/07.
//  Copyright © 2016年 Masamichi Ebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var slideShowButton: UIButton!
    
    let photoList = ["images/image01.jpg", "images/image02.jpg", "images/image03.jpg"]
    var currentPhotoIndex = 0
    var currentImageView:UIView!
    
    var slideshowState = false
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        myViewArray.append(firstView)
//        myViewArray.append(secondView)
//        myViewArray.append(thirdView)
        
        let rect = CGRect(x:0, y:0, width:300, height:200)
        let imageView = UIImageView(frame: rect)
        imageView.image = UIImage(named: "images/image01.jpg")
        imageView.contentMode = .ScaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.center = self.view.center
        self.view.addSubview(imageView)
        currentImageView = imageView;
        
        let constraintX = NSLayoutConstraint (
            item: imageView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        
        let constraintY = NSLayoutConstraint (
            item: imageView,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0)

        let constraintWidth = NSLayoutConstraint (
            item: imageView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 4/5,
            constant: 0)

        let constraintHeight = NSLayoutConstraint (
            item: imageView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Height,
            multiplier: 3/5,
            constant: 0)

        
        self.view.addConstraint(constraintX)
        self.view.addConstraint(constraintY)
        self.view.addConstraint(constraintWidth)
        self.view.addConstraint(constraintHeight)
    
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func performForward(sender: AnyObject) {
        currentPhotoIndex += 1
        if currentPhotoIndex >= photoList.count {
            currentPhotoIndex = 0
        }
        
        self.performTransition(currentPhotoIndex)
    }
    
    
    @IBAction func performBackward(sender: AnyObject) {
        currentPhotoIndex -= 1
        if currentPhotoIndex < 0 {
            currentPhotoIndex = photoList.count - 1
        }
        
        self.performTransition(currentPhotoIndex)
    }
    
    
    @IBAction func performSlideshow(sender: AnyObject) {
//        var controlState: UIControlState
        
        if slideshowState == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(
                2.0,
                target: self,
                selector: #selector(ViewController.Slideshow),
                userInfo: nil,
                repeats: true
            )
            
            forwardButton.enabled = false
            backwardButton.enabled = false
            
//            controlState = slideShowButton.state
//            slideShowButton.setTitle("stop", forState: controlState)
            slideShowButton.setTitle("停止", forState: .Normal)
            
            slideshowState = true
            
        } else {
            timer.invalidate()
            
            forwardButton.enabled = true
            backwardButton.enabled = true
            
//            controlState = slideShowButton.state
//            slideShowButton.setTitle("play", forState: controlState)
            slideShowButton.setTitle("再生", forState: .Normal)
            
            slideshowState = false
        }
    }
    
    
    func Slideshow() {
        currentPhotoIndex += 1
        if currentPhotoIndex >= photoList.count {
            currentPhotoIndex = 0
        }
        
        self.performTransition(currentPhotoIndex)
    }
    
    
    func performTransition(newIndex:Int) {
        let rect = CGRect(x:0, y:0, width:300, height:200)
        let newImageView = UIImageView(frame: rect)
        newImageView.contentMode = .ScaleAspectFit
        let photoName = photoList[newIndex]
        newImageView.image = UIImage(named: photoName)
        newImageView.center = self.view.center
        
        UIView.transitionFromView(
            currentImageView,
            toView: newImageView,
            duration: 1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            completion: nil)
        
        currentImageView = newImageView
        currentPhotoIndex = newIndex
        
        newImageView.userInteractionEnabled = true
        newImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    

    func imageTapped(sender: UITapGestureRecognizer) {
        let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController")
        let resultViewController:ResultViewController = nextVC as! ResultViewController
        resultViewController.currentPhotoIndex = currentPhotoIndex
        
        nextVC?.modalTransitionStyle = .CrossDissolve
        self.presentViewController(nextVC!, animated: true, completion: nil)
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

