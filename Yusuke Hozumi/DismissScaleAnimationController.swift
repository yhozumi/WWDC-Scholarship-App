//
//  DismissScaleAnimation.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 5/1/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class DismissScaleAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = 1.0
    var centerFrame: CGPoint?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        containerView.insertSubview(toView, belowSubview: fromView)
        
        UIView.animateWithDuration(duration / 2, delay: 0.0, options: .CurveEaseIn, animations: {
            fromView.transform = CGAffineTransformMakeScale(0.5, 0.5)
            }, completion: nil)
        
        UIView.animateWithDuration(duration / 2, delay: duration / 2, options: .CurveEaseOut, animations: {
            fromView.center.y += toView.frame.height
            }, completion: {_ in
                   transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
 
    }
}
