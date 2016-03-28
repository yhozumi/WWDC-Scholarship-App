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
        scrollView = UIScrollView(frame: self.view.bounds)
        setUpScrollView(scrollView)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        setUpDynamicAnimator(animator)
        
        let x = scrollView.contentSize.width / 2 - 20
        let y = scrollView.contentSize.height / 2 - 20
        let bubble = BubbleView(frame: CGRect(x: x, y: y, width: 20, height: 20))
        bubble.bubbleViewColor = .redColor()
        scrollView.addSubview(bubble)
        self.view.addSubview(scrollView)
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