//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    private var scrollView: MainPageScrollView!
    private var animator: UIDynamicAnimator!
    @IBOutlet weak var helloLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showBubbleViewAndLabel()
        self.view.backgroundColor = UIColor(red: 41.0/255.0, green: 44.0/255.0, blue: 54.0/255.0, alpha: 1.0)
    }
    
    private func showBubbleViewAndLabel() {
        let frame = CGRect(x: self.view.center.x - 57.5, y: self.view.center.y - 57.5, width: 115, height: 115)
        let bubble = BubbleView(frame: frame, color: UIColor.accentBlueColor(), textColor: UIColor.whiteColor(), text: "Press")
        bubble.alpha = 0.0
        self.view.addSubview(bubble)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainPageViewController.bubbleTapped))
        bubble.addGestureRecognizer(tapGesture)
        
        UIView.animateWithDuration(1.0, animations: {
            bubble.alpha = 1.0
            self.helloLabel.alpha = 1.0
        })
    }
    
    func bubbleTapped(tapGesture: UITapGestureRecognizer) {
        UIView.animateWithDuration(1.0, animations: {
            tapGesture.view?.alpha = 0.0
            }, completion: { _ in
                tapGesture.view?.removeFromSuperview()
                self.setUpScrollView()
        })
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
        if let scrollView = scrollView {
            scrollView.contentOffset.x = scrollView.contentSize.width / 2 - self.view.bounds.width / 2
            print(scrollView.contentSize)
        }
    }
}

extension MainPageViewController: BubbleViewDelegate {
    //Most Likely to break in the future, -- Find a better way --
    func bubbleViewPressed(name: String) {
        guard let viewController = storyboard?.instantiateViewControllerWithIdentifier(name) else { return }
        self.navigationController!.pushViewController(viewController, animated: true)
        print("\(name) instantiated")
    }
}

extension MainPageViewController: UIScrollViewDelegate {
    
}

