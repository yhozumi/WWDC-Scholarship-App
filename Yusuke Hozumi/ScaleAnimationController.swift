//
//  ScaleAnimationController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 5/1/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class ScaleAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRectZero
    
    private let duration = 0.6
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let finalFrame = toView.frame
        
        let xScale = originFrame.width / finalFrame.width
        let yScale = originFrame.height / finalFrame.height
        
        let scale = CGAffineTransformMakeScale(xScale / 2, yScale / 2)
        
        toView.layer.cornerRadius = originFrame.width
        toView.transform = scale
        toView.center = CGPoint(x: CGRectGetMidX(originFrame), y: CGRectGetMidY(originFrame))
        toView.clipsToBounds = true
        
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(duration, delay: 0.0, options: .CurveEaseIn, animations: {
            toView.transform = CGAffineTransformIdentity
            toView.center = CGPoint(x: CGRectGetMidX(finalFrame), y: CGRectGetMidY(finalFrame))
            toView.layer.cornerRadius = 0.0
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        
        })
        
    }
}
