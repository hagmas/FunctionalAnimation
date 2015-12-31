//
//  CharacterData.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/31.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import UIKit

enum CharacterData {
    case Brown, Lenard, Cony, Sally
    
    var color: CGColorRef {
        switch self {
        case .Brown:
            return UIColor(red: 142/255, green: 96/255, blue: 66/255, alpha: 1.0).CGColor
        case .Lenard:
            return UIColor(red: 101/255, green: 175/255, blue: 78/255, alpha: 1.0).CGColor
        case .Cony:
            return UIColor.whiteColor().CGColor
        case .Sally:
            return UIColor(red: 255/255, green: 224/255, blue: 77/255, alpha: 1.0).CGColor
        }
    }
    
    var path: CGPathRef {
        switch self {
        case .Brown:
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(58,18))
            path.addCurveToPoint(CGPointMake(80,33), controlPoint1: CGPointMake(72,17), controlPoint2: CGPointMake(80,33))
            path.addCurveToPoint(CGPointMake(101,30), controlPoint1: CGPointMake(80,33), controlPoint2: CGPointMake(89,30))
            path.addCurveToPoint(CGPointMake(123,34), controlPoint1: CGPointMake(116,30), controlPoint2: CGPointMake(123,34))
            path.addCurveToPoint(CGPointMake(143,18), controlPoint1: CGPointMake(123,34), controlPoint2: CGPointMake(128,18))
            path.addCurveToPoint(CGPointMake(165,56), controlPoint1: CGPointMake(171,19), controlPoint2: CGPointMake(165,56))
            path.addCurveToPoint(CGPointMake(186,106), controlPoint1: CGPointMake(165,56), controlPoint2: CGPointMake(186,68))
            path.addCurveToPoint(CGPointMake(99,181), controlPoint1: CGPointMake(187,143), controlPoint2: CGPointMake(155,183))
            path.addCurveToPoint(CGPointMake(13,110), controlPoint1: CGPointMake(42,179), controlPoint2: CGPointMake(13,143))
            path.addCurveToPoint(CGPointMake(38,52), controlPoint1: CGPointMake(13,69), controlPoint2: CGPointMake(38,52))
            path.addCurveToPoint(CGPointMake(58,18), controlPoint1: CGPointMake(38,52), controlPoint2: CGPointMake(33,21))
            path.closePath()
            return path.CGPath
            
        case .Lenard:
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(61,27))
            path.addCurveToPoint(CGPointMake(83,63), controlPoint1: CGPointMake(87,27), controlPoint2: CGPointMake(83,63))
            path.addCurveToPoint(CGPointMake(97,62), controlPoint1: CGPointMake(83,63), controlPoint2: CGPointMake(89,62))
            path.addCurveToPoint(CGPointMake(110,63), controlPoint1: CGPointMake(106,62), controlPoint2: CGPointMake(110,63))
            path.addCurveToPoint(CGPointMake(134,27), controlPoint1: CGPointMake(110,63), controlPoint2: CGPointMake(107,27))
            path.addCurveToPoint(CGPointMake(156,78), controlPoint1: CGPointMake(171,27), controlPoint2: CGPointMake(156,78))
            path.addCurveToPoint(CGPointMake(188,123), controlPoint1: CGPointMake(156,78), controlPoint2: CGPointMake(188,90))
            path.addCurveToPoint(CGPointMake(100,180), controlPoint1: CGPointMake(188,156), controlPoint2: CGPointMake(153,180))
            path.addCurveToPoint(CGPointMake(9,125), controlPoint1: CGPointMake(47,180), controlPoint2: CGPointMake(10,160))
            path.addCurveToPoint(CGPointMake(37,80), controlPoint1: CGPointMake(7,90), controlPoint2: CGPointMake(37,80))
            path.addCurveToPoint(CGPointMake(61,27), controlPoint1: CGPointMake(37,80), controlPoint2: CGPointMake(21,27))
            path.closePath()
            return path.CGPath
            
        case .Cony:
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(69,6))
            path.addCurveToPoint(CGPointMake(95,45), controlPoint1: CGPointMake(90,4), controlPoint2: CGPointMake(95,45))
            path.addCurveToPoint(CGPointMake(102,45), controlPoint1: CGPointMake(95,45), controlPoint2: CGPointMake(99,45))
            path.addCurveToPoint(CGPointMake(110,46), controlPoint1: CGPointMake(108,46), controlPoint2: CGPointMake(110,46))
            path.addCurveToPoint(CGPointMake(137,6), controlPoint1: CGPointMake(110,46), controlPoint2: CGPointMake(112,6))
            path.addCurveToPoint(CGPointMake(147,60), controlPoint1: CGPointMake(162,6), controlPoint2: CGPointMake(147,60))
            path.addCurveToPoint(CGPointMake(182,121), controlPoint1: CGPointMake(147,60), controlPoint2: CGPointMake(185,77))
            path.addCurveToPoint(CGPointMake(98,193), controlPoint1: CGPointMake(178,171), controlPoint2: CGPointMake(133,194))
            path.addCurveToPoint(CGPointMake(14,119), controlPoint1: CGPointMake(55,192), controlPoint2: CGPointMake(14,163))
            path.addCurveToPoint(CGPointMake(57,55), controlPoint1: CGPointMake(14,75), controlPoint2: CGPointMake(57,55))
            path.addCurveToPoint(CGPointMake(69,6), controlPoint1: CGPointMake(57,55), controlPoint2: CGPointMake(40,9))
            path.closePath()
            return path.CGPath
            
        case .Sally:
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(179,100))
            path.addCurveToPoint(CGPointMake(99,179), controlPoint1: CGPointMake(179,143), controlPoint2: CGPointMake(143,179))
            path.addCurveToPoint(CGPointMake(20,100), controlPoint1: CGPointMake(56,179), controlPoint2: CGPointMake(20,143))
            path.addCurveToPoint(CGPointMake(99,20), controlPoint1: CGPointMake(20,56), controlPoint2: CGPointMake(56,20))
            path.addCurveToPoint(CGPointMake(179,100), controlPoint1: CGPointMake(143,20), controlPoint2: CGPointMake(179,56))
            path.closePath()
            return path.CGPath
            
        }
    }
}
