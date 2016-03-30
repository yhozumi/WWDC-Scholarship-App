//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    private var scrollView: UIScrollView!
    private var animator: UIDynamicAnimator!
    private var gravityField: UIFieldBehavior!
    private var gravity: UIGravityBehavior!
    
    override func viewDidLoad() {
        scrollView = UIScrollView(frame: self.view.bounds)
        setUpScrollView(scrollView)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        setUpDynamicAnimator(animator)
        
        
        let x = scrollView.contentSize.width / 2 - 20
        let y = scrollView.contentSize.height / 2 - 20
        let bubble = BubbleView(frame: CGRect(x: x, y: y, width: 60, height: 60))
        bubble.layer.cornerRadius = bubble.frame.width / 2
        bubble.bubbleViewColor = .redColor()
        
        scrollView.addSubview(bubble)
        print("center of the bubble: \(bubble.center)")
        self.view.addSubview(scrollView)
        
        gravityField = UIFieldBehavior.radialGravityFieldWithPosition(CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2))
        gravityField.addItem(bubble)
        gravityField.strength = 0.5
        animator.addBehavior(gravityField)
        
        let collision = UICollisionBehavior(items: [bubble])
        collision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsZero)
        animator.addBehavior(collision)
        
        animator.debugEnabled = true
        
        animator.delegate = self
        
    }
    
    private func setUpScrollView(scrollView: UIScrollView) {
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 2, height: self.view.bounds.height * 2)
        scrollView.backgroundColor = .clearColor()
        scrollView.contentOffset = CGPoint(x: scrollView.contentSize.width / 4, y: scrollView.contentSize.height / 4)
        scrollView.delegate = self
    }
    
    private func setUpDynamicAnimator(animator: UIDynamicAnimator) {
        
    }
}

extension MainPageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}

extension MainPageViewController: UIDynamicAnimatorDelegate {
    
}