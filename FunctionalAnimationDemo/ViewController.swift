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
    enum State {
        case first, second, third, fourth
        
        var path: CGPathRef {
            switch self {
            case .first:
                return CharacterData.Brown.path
            case .second:
                return CharacterData.Sally.path
            case .third:
                return CharacterData.Lenard.path
            case .fourth:
                return CharacterData.Cony.path
            }
        }
        
        var fillColor: CGColorRef {
            switch self {
            case .first:
                return CharacterData.Brown.color
            case .second:
                return CharacterData.Sally.color
            case .third:
                return CharacterData.Lenard.color
            case .fourth:
                return CharacterData.Cony.color
            }
        }
        
        
        var nextState: State {
            switch self {
            case .first:
                return .second
            case .second:
                return .third
            case .third:
                return .fourth
            case .fourth:
                return .first
            }
        }
    }
    
    
    let maskedLayer = CALayer()
    let maskLayer   = CAShapeLayer()
    let shapeLayer  = CAShapeLayer()
    
    var state: State = .first {
        didSet {
            CATransaction.begin()
            CATransaction.setCompletionBlock { () -> Void in
                self.view.userInteractionEnabled = true
                self.shapeLayer.opacity = 0.0
                self.shapeLayer.path = self.state.nextState.path
                self.shapeLayer.fillColor = self.state.nextState.fillColor
            }
            maskedLayer.backgroundColor = state.fillColor
            
            maskLayer.path = state.path
            
            shapeLayer.opacity = 1.0
            maskLayer.removeAllAnimations()
            shapeLayer.removeAllAnimations()
            CATransaction.commit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        maskedLayer.frame = view.bounds
        maskedLayer.backgroundColor = state.fillColor
        
        view.layer.addSublayer(maskedLayer)
        
        // Add Mask layer
        maskLayer.frame = CGRectMake(view.bounds.size.width/2 - 100, view.bounds.size.height/2 - 100, 200, 200)
        maskLayer.path = state.path
        maskLayer.fillColor = UIColor.blackColor().CGColor
        
        maskedLayer.mask = maskLayer
        
        // Add Shape Layer
        shapeLayer.frame = CGRectMake(view.bounds.size.width/2 - 100, view.bounds.size.height/2 - 100, 200, 200)
        shapeLayer.path = state.nextState.path
        shapeLayer.fillColor = state.nextState.fillColor
        shapeLayer.opacity = 0.0
        shapeLayer.actions = ["opacity": NSNull()]
        
        maskedLayer.addSublayer(shapeLayer)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.userInteractionEnabled = false
        
        let animation = FunctionalAnimation<TransformScale>()
        animation.duration = 0.2
        animation.fromValue = 1.0
        animation.toValue = 0.5
        animation.interpolatingFunction = .ExponentialDecay(6.0)
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        maskLayer.addAnimation(animation, forKey: nil)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let animation = FunctionalAnimation<TransformScale>()
        animation.duration = 0.8
        animation.fromValue = 0.5
        animation.toValue = 4.5
        animation.interpolatingFunction = .ExponentialGrowth(12.0)
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.view.layer.backgroundColor = self.state.fillColor
        }
        maskLayer.addAnimation(animation, forKey: "animation")
        CATransaction.commit()
        
        let opAnim = CABasicAnimation(keyPath: "opacity")
        opAnim.fromValue = 0.0
        opAnim.toValue = 1.0
        
        let scAnim = FunctionalAnimation<TransformScale>()
        scAnim.fromValue = 0.5
        scAnim.toValue = 1.0
        scAnim.interpolatingFunction = .ExponentialDecay(6.0)
        
        let animGp = CAAnimationGroup()
        animGp.animations = [opAnim, scAnim]
        animGp.duration = 0.5
        animGp.beginTime = CACurrentMediaTime() + 0.8
        animGp.removedOnCompletion = false
        animGp.fillMode = kCAFillModeForwards
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.state = self.state.nextState
        }
        shapeLayer.addAnimation(animGp, forKey: "animGp")
        CATransaction.commit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

