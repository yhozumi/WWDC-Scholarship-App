//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

let pastelRed = UIColor(red: 253.0/255.0, green: 49.0/255.0, blue: 89.0/255.0, alpha: 1.0)

class MainPageViewController: UIViewController {
    private var scrollView: UIScrollView!
    private var animator: UIDynamicAnimator!
    
    private var scrollViewCenter: CGPoint {
        return CGPoint(x: scrollView.contentSize.width / 2, y: scrollView.contentSize.height / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setUpDynamicAnimator()
        
        
        // -- TEST Code
        animator.debugEnabled = false
        let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        let bubble = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble1 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble2 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble3 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble4 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble5 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble6 = BubbleView(frame: rect, color: pastelRed, text: "test")
        let bubble7 = BubbleView(frame: rect, color: pastelRed, text: "test")
        
        let bubbles = [bubble, bubble1, bubble2, bubble3, bubble4, bubble5, bubble6, bubble7]
        
        let _ = bubbles.map { scrollView.addSubview($0) }
        
        configureGravityField(bubbles, center: scrollViewCenter)
        configureBoundaryWithSize(CGSize(width: 50, height: 50),
                                  center: CGPoint(x: scrollViewCenter.x - 25, y: scrollViewCenter.y - 25),
                                  views: bubbles)
        allowRotationOnViews(bubbles, allowRotation: false)
    }
    
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self.scrollView)
        animator.delegate = self
    }
    
    private func configureGravityField(viewsToAdd: [UIView], center: CGPoint) {
        print("scrollView center: \(scrollViewCenter)")
        let gravity = UIFieldBehavior.radialGravityFieldWithPosition(scrollViewCenter)
        gravity.strength = 1.0
        let _ = viewsToAdd.map { gravity.addItem($0) }
        animator.addBehavior(gravity)
    }
    
    private func configureBoundaryWithSize(size: CGSize, center: CGPoint, views: [UIView]) {
        let collision = UICollisionBehavior(items: views)
        collision.addBoundaryWithIdentifier("center boundary",
                                            forPath: UIBezierPath(ovalInRect: CGRect(origin: center, size: size)))
        animator.addBehavior(collision)
    }
    
    private func allowRotationOnViews(views: [UIView], allowRotation: Bool) {
        let itemBehavior = UIDynamicItemBehavior(items: views)
        itemBehavior.allowsRotation = allowRotation
        animator.addBehavior(itemBehavior)
    }
    
    private func setUpScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 1.5, height: self.view.bounds.height)
        print(scrollView.center)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
    }
}

extension MainPageViewController: UIDynamicAnimatorDelegate {
    
}

extension MainPageViewController: UIScrollViewDelegate {

}