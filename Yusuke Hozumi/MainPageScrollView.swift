//
//  MainPageScrollView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/17/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class MainPageScrollView: UIScrollView {
   
    private var animator: UIDynamicAnimator!
    private var gravity: UIFieldBehavior!
    private var collision: UICollisionBehavior!
    
    private(set) var bubbles: [BubbleView] = []
    
    private let texts: [String] = [
        "Timeline",
        "About Me",
        "Contact",
        "Projects",
        "Photos",
        "Schedule"
    ]
    
    private var scrollViewCenter: CGPoint {
        return CGPoint(x: self.contentSize.width / 2, y: self.contentSize.height / 2)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpDynamicAnimator()
        animator.debugEnabled = true
        setUpBubbleViews()
        allowRotationOnViews(bubbles, allowRotation: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let centerCollisionWidth: CGFloat = 25.0
        let collisionCenter = CGPoint(x: scrollViewCenter.x - centerCollisionWidth / 2, y: scrollViewCenter.y - centerCollisionWidth / 2)
        configureGravityField(bubbles, center: scrollViewCenter)
        configureBoundaryWithSize(CGSize(width: centerCollisionWidth, height: centerCollisionWidth), center: collisionCenter, views: bubbles)
    }
    
    
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self)
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
        itemBehavior.elasticity = 0.3
        animator.addBehavior(itemBehavior)
    }

    private func setUpBubbleViews() {
        let rect = CGRect(x: scrollViewCenter.x, y: 150, width: 115, height: 115)
        let _ = texts.map { bubbles.append(BubbleView(frame: rect, color: pastelRed, text: $0)) }
        let _ = bubbles.map { self.addSubview($0)
            $0.alpha = 0.0
        }
    }
}


extension MainPageScrollView: UIDynamicAnimatorDelegate {
    
}

extension MainPageScrollView: UICollisionBehaviorDelegate {
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        UIView.animateWithDuration(0.4, animations: { _ in
            guard let item = item as? UIView else { return }
            item.alpha = 1.0
        })
    }
}


