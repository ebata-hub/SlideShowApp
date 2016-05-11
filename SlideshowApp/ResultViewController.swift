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
 
    /*
    override func showViewController(vc: UIViewController, sender: AnyObject?) {
        let rect = CGRect(x:0, y:0, width:400, height:300)
        imageView.frame = rect
        imageView.contentMode = .ScaleAspectFit
        imageView.center = self.view.center
        self.view.addSubview(imageView)
    }
    */
    
    override func viewDidAppear(animated: Bool) {
        let rect = CGRect(x:0, y:0, width:400, height:300)
        let imageView = UIImageView(frame: rect)
        imageView.contentMode = .ScaleAspectFit
        let photoName = photoList[currentPhotoIndex]
        imageView.image = UIImage(named: photoName)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        self.view.addSubview(imageView)
    }
}
