//
//  ViewController.swift
//  FunctionalAnimationDemo
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import UIKit
import FunctionalAnimation

class ViewController: UIViewController {

    let animationLayer = CALayer()
    let maskLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.layer.backgroundColor = UIColor.redColor().CGColor
        
        animationLayer.frame = view.bounds
        animationLayer.backgroundColor = UIColor.blueColor().CGColor
    
        view.layer.addSublayer(animationLayer)
        
        // add mask layer
        maskLayer.frame = CGRectMake(view.bounds.size.width/2 - 100, view.bounds.size.height/2 - 100, 200, 200)
        maskLayer.backgroundColor = UIColor.blackColor().CGColor
        
        animationLayer.mask = maskLayer
        
        let animation = FunctionalAnimation<TransformScale>()
        animation.fromValue = 1.0
        animation.toValue = 2.0
        animation.interpolatingFunction = .ExponentialGrowth(6.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

