import UIKit

public enum InterpolatingFunction {
    typealias FunctionType = (Float -> Float)
    
    case Default
    case ExponentialDecay(Float)
    case ExponentialGrowth(Float)
    case Bezier(Float, Float)
    case OrderResponse(Float, Float)
    
    func function() -> FunctionType {
        switch self {
            
        case .Default:
            return {(position: Float) in return position}
            
        case .ExponentialDecay(let coeff):
            let offset = exp(-coeff)
            let scale = 1.0 / (1.0 - offset)
            return {(position: Float) in return 1.0 - scale * (exp(position * -coeff) - offset)}
        
        case .ExponentialGrowth(let coeff):
            let offset = exp(coeff)
            let scale = 1 / (offset - 1)
            return {(position: Float) in return (exp(position * coeff) - 1) * scale}
            
        case .Bezier(let first, let second):
            return {(position: Float) in return 3 * position * (1 - position) * (1 - position) * first +
                3 * position * position * (1 - position) * second +
                position * position * position * 1.0}
            
        case .OrderResponse(let omega, let zeta):
            let beta = sqrt(1 - zeta * zeta)
            let phi = atan(beta / zeta)
            return {(position: Float) in return 1.0 + -1.0 / beta * exp(-zeta * omega * position) * sin(beta * omega * position + phi)}
        }
    }
    
}