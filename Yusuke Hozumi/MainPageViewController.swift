//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

let darkBlue = UIColor(red: 24.0/255.0, green: 42.0/255.0, blue: 63.0/255.0, alpha: 1.0)

class MainPageViewController: UIViewController {
    private var scrollView: MainPageScrollView!
    private var animator: UIDynamicAnimator!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        
    }
    
    //setting up custom scrollView class that has Dynamic Animator in it.
    private func setUpScrollView() {
        scrollView = MainPageScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 1.5, height: self.view.bounds.height)
        scrollView.backgroundColor = UIColor.clearColor()
        print(scrollView.center)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.delegate = self
        let _ = scrollView.bubbles.map { $0.delegate = self }
        view.addSubview(scrollView)
    }
    
    //center's the scrollview so when it loads it's centered
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentOffset.x = scrollView.contentSize.width / 2 - self.view.bounds.width / 2
    }
    
    private func showHelloLabel() {
        UIView.animateWithDuration(0.4, animations: {
            self.helloLabel.alpha = 1.0
            }, completion: nil)
    }
}

extension MainPageViewController: BubbleViewDelegate {
    //Most Likely to break in the future, -- Find a better way --
    func bubbleViewPressed(name: String) {
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(name)
        self.navigationController!.pushViewController(viewController!, animated: true)
        print("\(name) instantiated")
    }
}

extension MainPageViewController: UIScrollViewDelegate {
    
}

