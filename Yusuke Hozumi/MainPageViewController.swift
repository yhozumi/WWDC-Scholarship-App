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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setUpDynamicAnimator()
        
        animator.debugEnabled = true
        
        let rect = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        let bubble = BubbleView(frame: rect, color: .redColor(), text: "test")
        
        scrollView.addSubview(bubble)
        let gravity = configureGravityField([bubble])
        animator.addBehavior(gravity)
        
        
    }
    
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self.scrollView)
        animator.delegate = self
    }
    
    private func configureGravityField(viewsToAdd: [UIView]) -> UIFieldBehavior {
        let scrollViewCenter = CGPoint(x: scrollView.contentSize.width / 2, y: scrollView.contentSize.height / 2)
        print("scrollView center: \(scrollViewCenter)")
        let gravity = UIFieldBehavior.radialGravityFieldWithPosition(scrollViewCenter)
        gravity.strength = 0.5
        let _ = viewsToAdd.map { gravity.addItem($0) }
        return gravity
    }
    
    private func configureBoundaryWith(size: CGSize) {
        
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
        print(scrollView.contentOffset.x)
        print(scrollView.contentSize.width)
        
    }
}

extension MainPageViewController: UIDynamicAnimatorDelegate {
    
}

extension MainPageViewController: UIScrollViewDelegate {

}