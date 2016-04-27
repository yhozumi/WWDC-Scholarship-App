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
    private let colorPalette = UIColor.colorPalette()
    private let textColorPalette = UIColor.bubbleTextColorPalette()
    
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
        animator.debugEnabled = false
        setUpBubbleViews(frame)
        allowRotationOnViews(bubbles, allowRotation: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let centerCollisionWidth: CGFloat = 25.0
        let collisionCenter = CGPoint(x: scrollViewCenter.x - centerCollisionWidth / 2, y: scrollViewCenter.y - centerCollisionWidth / 2)
        configureGravityField(bubbles, center: scrollViewCenter)
        configureBoundaryWithSize(CGSize(width: centerCollisionWidth, height: centerCollisionWidth), center: collisionCenter, views: bubbles)
    }
    
    //Initial set up for Dynamic animator
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
    }
    
    //Takes in an array of UIView and center point to create a gravity field and add's all the UIViews into the gravity field to be affected
    //by the gravity field
    private func configureGravityField(viewsToAdd: [UIView], center: CGPoint) {
        let gravity = UIFieldBehavior.radialGravityFieldWithPosition(scrollViewCenter)
        gravity.strength = 1.0
        gravity.minimumRadius = 1.0
        let _ = viewsToAdd.map { gravity.addItem($0) }
        animator.addBehavior(gravity)
    }
    
    //Creates a boundary with size, center, and views
    private func configureBoundaryWithSize(size: CGSize, center: CGPoint, views: [UIView]) {
        let collision = UICollisionBehavior(items: views)
        collision.addBoundaryWithIdentifier("center boundary",
                                            forPath: UIBezierPath(ovalInRect: CGRect(origin: center, size: size)))
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    }
    
    //by using UIDynamicItemBehavior this will cusomize the rotation of the view and elasticity
    private func allowRotationOnViews(views: [UIView], allowRotation: Bool) {
        let itemBehavior = UIDynamicItemBehavior(items: views)
        itemBehavior.allowsRotation = allowRotation
        itemBehavior.elasticity = 0.1
        animator.addBehavior(itemBehavior)
    }

    //Set up code for the bubbleViews and adds the texts into it's label
    private func setUpBubbleViews(frame: CGRect) {
        let bubbleSize = CGSize(width: 115.0, height: 115.0)
        let centerPoint = CGPoint(x: (frame.width / 2 - bubbleSize.width / 2) * 1.5, y: (frame.height / 2 - bubbleSize.height) * 1.5)
        let bubbleFrame = CGRect(origin: centerPoint, size: bubbleSize)
        let _ = texts.map {
            bubbles.append(BubbleView(frame: bubbleFrame, color: colorPalette[texts.indexOf($0)!],
                textColor: textColorPalette[texts.indexOf($0)!],
                text: $0)) }
        let _ = bubbles.map { self.addSubview($0)
            $0.alpha = 0.0
        }
    }
}

extension MainPageScrollView: UICollisionBehaviorDelegate {
    //When the bubbles contact the center boundary it will cause the views alpha to animate
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        UIView.animateWithDuration(1.0, animations: { _ in
            guard let item = item as? UIView else { return }
            item.alpha = 1.0
        })
    }
}

extension MainPageScrollView: UIDynamicAnimatorDelegate {
    
}

