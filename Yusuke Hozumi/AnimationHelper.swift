//
//  AnimationHelper.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 5/1/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

struct AnimationHelper {
    static func yRotation(angle: Double) -> CATransform3D {
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }
    
    static func perspectiveTransformForContainerView(containerView: UIView) {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
}

