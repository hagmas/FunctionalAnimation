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