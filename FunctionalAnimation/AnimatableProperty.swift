//
//  AnimatableProperty.swift
//  FunctionalAnimation
//
//  Created by Haga Masaki on 2015/12/26.
//  Copyright © 2015年 Haga Masaki. All rights reserved.
//

import UIKit

public protocol AnimatableProperty {
    typealias PropertyType: SIMDCompatible
    static func keyPath() -> String // Swift2.1: Static Stored Property is not supported yet.
}

// MARK: Transform
struct Opacity: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "opacity"
    }
}

struct Transform: AnimatableProperty {
    typealias PropertyType = CATransform3D
    static func keyPath() -> String {
        return "transform"
    }
}

struct TransformRotation: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.rotation"
    }
}

struct TransformRotationX: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.rotation.x"
    }
}

struct TransformRotationY: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.rotation.y"
    }
}

struct TransformRotationZ: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.rotation.z"
    }
}

struct TransformScale: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.scale"
    }
}

struct TransformScaleX: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.scale.x"
    }
}

struct TransformScaleY: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.scale.y"
    }
}

struct TransformScaleZ: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.scale.z"
    }
}

struct TransformTranslation: AnimatableProperty {
    typealias PropertyType = CGSize
    static func keyPath() -> String {
        return "transform.translation"
    }
}

struct TransformTranslationX: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "transform.translation.x"
    }
}

struct TransformTranslationY: AnimatableProperty {
    typealias PropertyType = CGSize
    static func keyPath() -> String {
        return "transform.translation.y"
    }
}

struct TransformTranslationZ: AnimatableProperty {
    typealias PropertyType = CGSize
    static func keyPath() -> String {
        return "transform.translation.z"
    }
}

// MARK: Bounds
struct BoundsSize: AnimatableProperty {
    typealias PropertyType = CGSize
    static func keyPath() -> String {
        return "bounds.size"
    }
}

struct BoundsSizeX: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "bounds.size.x"
    }
}

struct BoundsSizeY: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "bounds.size.y"
    }
}

// MARK: Position
struct Position: AnimatableProperty {
    typealias PropertyType = CGSize
    static func keyPath() -> String {
        return "position"
    }
}

struct PositionX: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "position.x"
    }
}

struct PositionY: AnimatableProperty {
    typealias PropertyType = CGFloat
    static func keyPath() -> String {
        return "position.y"
    }
}
