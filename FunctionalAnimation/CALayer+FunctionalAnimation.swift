//
//  CALayer+FunctionalAnimation.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import UIKit

public extension CALayer {
    class func switchAddAnimation() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = Selector("addAnimation:forKey:")
            let swizzledSelector = Selector("fa_addAnimation:forKey:")
            
            let originalMethod = class_getInstanceMethod(CALayer.self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(CALayer.self, swizzledSelector)
            
            let didAddMethod = class_addMethod(CALayer.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(CALayer.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
    
    func recursiveSetValues(animation: CAAnimation, superAnimation: CAAnimationGroup?) {
        if let groupAnim = animation as? CAAnimationGroup, animations = groupAnim.animations {
            for anim in animations {
                recursiveSetValues(anim, superAnimation: groupAnim)
            }
        } else if var faAnim = animation as? FunctionalAnimationProtocol {
            if let _superAnimation = superAnimation where faAnim.duration == 0 {
                faAnim.duration = _superAnimation.duration
            }
            faAnim.setValuesWithLayer(self)
        }
    }
    
    // MARK: - Method Swizzling
    func fa_addAnimation(animation: CAAnimation, forKey key: String) {
        recursiveSetValues(animation, superAnimation: nil)
        self.fa_addAnimation(animation, forKey: key)
    }
}
