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
public struct Opacity: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "opacity"
    }
}

public struct Transform: AnimatableProperty {
    public typealias PropertyType = CATransform3D
    public static func keyPath() -> String {
        return "transform"
    }
}

public struct TransformRotation: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.rotation"
    }
}

public struct TransformRotationX: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.rotation.x"
    }
}

public struct TransformRotationY: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.rotation.y"
    }
}

public struct TransformRotationZ: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.rotation.z"
    }
}

public struct TransformScale: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.scale"
    }
}

public struct TransformScaleX: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.scale.x"
    }
}

public struct TransformScaleY: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.scale.y"
    }
}

public struct TransformScaleZ: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.scale.z"
    }
}

public struct TransformTranslation: AnimatableProperty {
    public typealias PropertyType = CGSize
    public static func keyPath() -> String {
        return "transform.translation"
    }
}

public struct TransformTranslationX: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "transform.translation.x"
    }
}

public struct TransformTranslationY: AnimatableProperty {
    public typealias PropertyType = CGSize
    public static func keyPath() -> String {
        return "transform.translation.y"
    }
}

public struct TransformTranslationZ: AnimatableProperty {
    public typealias PropertyType = CGSize
    public static func keyPath() -> String {
        return "transform.translation.z"
    }
}

// MARK: Bounds
public struct BoundsSize: AnimatableProperty {
    public typealias PropertyType = CGSize
    public static func keyPath() -> String {
        return "bounds.size"
    }
}

public struct BoundsSizeX: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "bounds.size.x"
    }
}

public struct BoundsSizeY: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "bounds.size.y"
    }
}

// MARK: Position
public struct Position: AnimatableProperty {
    public typealias PropertyType = CGSize
    public static func keyPath() -> String {
        return "position"
    }
}

public struct PositionX: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "position.x"
    }
}

public struct PositionY: AnimatableProperty {
    public typealias PropertyType = CGFloat
    public static func keyPath() -> String {
        return "position.y"
    }
}
