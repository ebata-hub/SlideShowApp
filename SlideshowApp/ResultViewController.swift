//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Masamichi Ebata on 2016/05/09.
//  Copyright © 2016年 Masamichi Ebata. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let photoList = ["images/image01.jpg", "images/image02.jpg", "images/image03.jpg"]
    var currentPhotoIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let rect = CGRect(x:0, y:0, width:400, height:300)
        let imageView = UIImageView(frame: rect)
        
        imageView.contentMode = .ScaleAspectFit
        let photoName = photoList[currentPhotoIndex]
        imageView.image = UIImage(named: photoName)
        self.view.addSubview(imageView)
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            multiplier: 4/5,
            constant: 0)
        
        self.view.addConstraint(constraintX)
        self.view.addConstraint(constraintY)
        self.view.addConstraint(constraintWidth)
        self.view.addConstraint(constraintHeight)

    }
}
