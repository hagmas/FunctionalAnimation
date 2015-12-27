//
//  FunctionalAnimation.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import UIKit
import simd

protocol FunctionalAnimationProtocol {
    func setValuesWithLayer(layer: CALayer)
    var duration: CFTimeInterval {get set}
}

public class FunctionalAnimation<T: AnimatableProperty>: CAKeyframeAnimation, FunctionalAnimationProtocol {
    
    public var fromValue:  T.PropertyType?
    public var toValue:    T.PropertyType?
    public var interpolatingFunction   = InterpolatingFunction.Default
    
    public override init() {
        super.init()
        keyPath = T.keyPath()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setValuesWithLayer(layer: CALayer) {
        
        guard let _fromValue = fromValue ?? T.PropertyType.cast(layer.valueForKeyPath(T.keyPath())) else {
            return
        }
        
        guard let _toValue = toValue ?? T.PropertyType.cast(layer.valueForKeyPath(T.keyPath())) else {
            return
        }
        
        let interpolationSteps = Int(duration*60)
        let delta = T.PropertyType.decomposeToVector(_toValue) - T.PropertyType.decomposeToVector(_fromValue)
        let offset: Float = 1/Float(interpolationSteps)
        var values = [AnyObject]()
        
        for i in 0...interpolationSteps {
            values.append(T.PropertyType.composeFromVector(T.PropertyType.decomposeToVector(_fromValue) + delta*T.PropertyType.VectorType(interpolatingFunction.function()(offset*Float(i)))).anyObject)
        }
        
        self.values = values
    }
}