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
    }
    
    private func setUpDynamicAnimator() {
        animator = UIDynamicAnimator(referenceView: self.view)
        animator.delegate = self
    }
    
    private func setUpScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 1.5, height: self.view.bounds.height)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
}

extension MainPageViewController: UIDynamicAnimatorDelegate {
    
}

extension MainPageViewController: UIScrollViewDelegate {
    
}