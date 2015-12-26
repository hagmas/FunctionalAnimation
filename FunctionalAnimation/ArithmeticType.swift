//
//  ArithmeticType.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import Foundation
import simd
import UIKit

public protocol ArithmeticType {
    init(_ scalar: Float)
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
}

extension CGFloat   : ArithmeticType {}
extension float4    : ArithmeticType {}
extension float3    : ArithmeticType {}
extension float2    : ArithmeticType {}
extension float4x4  : ArithmeticType {}