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
        
        
        let pastelBlue = UIColor.init(red: 68/255.0, green: 119/255.0, blue: 178/255.0, alpha: 1.0)
        let x = scrollView.contentSize.width / 2 - 20
        let y = scrollView.contentSize.height / 2 - 20
        let bubble = BubbleView(frame: CGRect(x: x, y: y, width: 60, height: 60))
        bubble.layer.cornerRadius = bubble.frame.width / 2
        bubble.bubbleViewColor = pastelBlue
        
        let bubble2 = BubbleView(frame: CGRect(x: x, y: y, width: 60, height: 60))
        bubble2.layer.cornerRadius = bubble.frame.width / 2
        bubble2.bubbleViewColor = pastelBlue
        
        let bubble3 = BubbleView(frame: CGRect(x: x, y: y, width: 60, height: 60))
        bubble3.layer.cornerRadius = bubble.frame.width / 2
        bubble3.bubbleViewColor = pastelBlue
        
        let bubble4 = BubbleView(frame: CGRect(x: x, y: y, width: 60, height: 60))
        bubble4.layer.cornerRadius = bubble.frame.width / 2
        bubble4.bubbleViewColor = pastelBlue
        
        let bubbles = [bubble, bubble2, bubble3, bubble4]
        
        let _ = bubbles.map { scrollView.addSubview($0) }
        
        print("center of the bubble: \(bubble.center)")
        self.view.addSubview(scrollView)
        
//        gravityField = UIFieldBehavior.radialGravityFieldWithPosition(CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2))
////        gravityField.addItem(bubble)
////        gravityField.addItem(bubble2)
////        gravityField.addItem(bubble3)
////        gravityField.addItem(bubble4)
        
        let _ = bubbles.map {
            let gravity = UIFieldBehavior.radialGravityFieldWithPosition($0.center)
            print("center of the bubble view \($0.center)")
            for bubble in bubbles {
                if bubble != $0 {
                    gravity.addItem(bubble)
                    print("gravity added")
                }
            }
            animator.addBehavior(gravity)
        }
        
        
        
        
        let collision = UICollisionBehavior(items: [bubble, bubble2, bubble3, bubble4])
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