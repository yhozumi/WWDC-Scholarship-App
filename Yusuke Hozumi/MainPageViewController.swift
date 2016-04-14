//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

let pastelRed = UIColor(red: 194.0/255.0, green: 59.0/255.0, blue: 34.0/255.0, alpha: 1.0)

class MainPageViewController: UIViewController {
    private var scrollView: UIScrollView!
    private var animator: UIDynamicAnimator!
    
    private var scrollViewCenter: CGPoint {
        return CGPoint(x: scrollView.contentSize.width / 2, y: scrollView.contentSize.height / 2)
    }
    
    private var bubbles: [BubbleView] = []
    
    //Create an Enum or Structs with these later
    private let texts: [String] = [
        "Timeline",
        "About Me",
        "Contact",
        "Projects",
        "Photos"
    ]
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setUpDynamicAnimator()
        
        animator.debugEnabled = true
        
        setUpBubbleViews()
        
        configureGravityField(bubbles, center: scrollViewCenter)
        configureBoundaryWithSize(CGSize(width: 25, height: 25),
                                  center: CGPoint(x: scrollViewCenter.x - 12.5, y: scrollViewCenter.y - 12.5),
                                  views: bubbles)
        allowRotationOnViews(bubbles, allowRotation: false)
        
    }
    
    private func setUpBubbleViews() {
        let rect = CGRect(x: scrollViewCenter.x, y: 100, width: 125, height: 125)
        let _ = texts.map { bubbles.append(BubbleView(frame: rect, color: pastelRed, text: $0)) }
        let _ = bubbles.map { scrollView.addSubview($0)
            $0.delegate = self
            $0.alpha = 0.0
        }
    }
    
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self.scrollView)
        animator.delegate = self
    }
    
    private func configureGravityField(viewsToAdd: [UIView], center: CGPoint) {
        print("scrollView center: \(scrollViewCenter)")
        let gravity = UIFieldBehavior.radialGravityFieldWithPosition(scrollViewCenter)
        gravity.strength = 1.0
        gravity.minimumRadius = 1.0
        let _ = viewsToAdd.map { gravity.addItem($0) }
        animator.addBehavior(gravity)
    }
    
    private func configureBoundaryWithSize(size: CGSize, center: CGPoint, views: [UIView]) {
        let collision = UICollisionBehavior(items: views)
        collision.addBoundaryWithIdentifier("center boundary",
                                            forPath: UIBezierPath(ovalInRect: CGRect(origin: center, size: size)))
        collision.collisionDelegate = self
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
        scrollView.contentOffset.x = scrollViewCenter.x - self.view.bounds.width / 2
    }
}

extension MainPageViewController: BubbleViewDelegate {
    //Most Likely break in the future, -- Find a better way --
    func bubbleViewPressed(name: String) {
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(name)
        self.navigationController!.pushViewController(viewController!, animated: true)
        print("\(name) instantiated")
    }
}

extension MainPageViewController: UIDynamicAnimatorDelegate {
    
}

extension MainPageViewController: UIScrollViewDelegate {
    
}

extension MainPageViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        UIView.animateWithDuration(0.4, animations: { _ in
            guard let item = item as? UIView else { return }
            item.alpha = 1.0
        })
    }
}