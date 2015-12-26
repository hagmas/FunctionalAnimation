//
//  SIMDCompatible.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import Foundation
import UIKit
import simd

public protocol SIMDCompatible {
    typealias VectorType:ArithmeticType
    static func composeFromVector(vector: VectorType) -> Self
    static func decomposeToVector(calculatable: Self) -> VectorType
    var anyObject: AnyObject { get }
    static func cast(anyObject: AnyObject?) -> Self?
}

extension CGFloat: SIMDCompatible {
    public static func composeFromVector(vector: CGFloat) -> CGFloat {
        return vector
    }
    
    public static func decomposeToVector(calculatable: CGFloat) -> CGFloat {
        return calculatable
    }
    
    public var anyObject: AnyObject {
        get {
            return self
        }
    }
    
    public static func cast(anyObject: AnyObject?) -> CGFloat? {
        return anyObject as? CGFloat
    }
}

extension CGPoint: SIMDCompatible {
    public static func composeFromVector(vector: float2) -> CGPoint {
        return CGPointMake(CGFloat(vector.x), CGFloat(vector.y))
    }
    
    public static func decomposeToVector(calculatable: CGPoint) -> float2 {
        return float2(Float(calculatable.x), Float(calculatable.y))
    }
    
    public var anyObject: AnyObject {
        get {
            return NSValue(CGPoint: self)
        }
    }
    
    public static func cast(anyObject: AnyObject?) -> CGPoint? {
        return (anyObject as? NSValue)?.CGPointValue()
    }
}

extension CGSize: SIMDCompatible {
    public static func composeFromVector(vector: float2) -> CGSize {
        return CGSizeMake(CGFloat(vector.x), CGFloat(vector.y))
    }
    
    public static func decomposeToVector(calculatable: CGSize) -> float2 {
        return float2(Float(calculatable.width), Float(calculatable.height))
    }
    
    public var anyObject: AnyObject {
        get {
            return NSValue(CGSize: self)
        }
    }
    
    public static func cast(anyObject: AnyObject?) -> CGSize? {
        return (anyObject as? NSValue)?.CGSizeValue()
    }
}

extension CATransform3D: SIMDCompatible {
    public static func composeFromVector(vector: float4x4) -> CATransform3D {
        return CATransform3D(m11: CGFloat(vector[0][0]), m12: CGFloat(vector[0][1]), m13: CGFloat(vector[0][2]), m14: CGFloat(vector[0][3]),
            m21: CGFloat(vector[1][0]), m22: CGFloat(vector[1][1]), m23: CGFloat(vector[1][2]), m24: CGFloat(vector[1][3]),
            m31: CGFloat(vector[2][0]), m32: CGFloat(vector[2][1]), m33: CGFloat(vector[2][2]), m34: CGFloat(vector[2][3]),
            m41: CGFloat(vector[3][0]), m42: CGFloat(vector[3][1]), m43: CGFloat(vector[3][2]), m44: CGFloat(vector[3][3]))
    }
    
    public static func decomposeToVector(calculatable: CATransform3D) -> float4x4 {
        let firstRow = float4(Float(calculatable.m11), Float(calculatable.m12), Float(calculatable.m13), Float(calculatable.m14))
        let secondRow = float4(Float(calculatable.m21), Float(calculatable.m22), Float(calculatable.m23), Float(calculatable.m24))
        let thirdRow = float4(Float(calculatable.m31), Float(calculatable.m32), Float(calculatable.m33), Float(calculatable.m34))
        let fourthRow = float4(Float(calculatable.m41), Float(calculatable.m42), Float(calculatable.m43), Float(calculatable.m44))
        return float4x4(rows: [firstRow, secondRow, thirdRow, fourthRow])
    }
    
    public var anyObject: AnyObject {
        get {
            return NSValue(CATransform3D: self)
        }
    }
    
    public static func cast(anyObject: AnyObject?) -> CATransform3D? {
        return (anyObject as? NSValue)?.CATransform3DValue
    }
}