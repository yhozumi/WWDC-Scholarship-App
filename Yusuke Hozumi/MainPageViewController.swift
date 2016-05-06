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
    @IBOutlet weak var labelStackView: UIStackView!
    private var selectedView: BubbleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showBubbleViewAndLabel()
        self.navigationController?.delegate = self
        self.view.backgroundColor = UIColor.darkBackGroundColor()
    }

    
    private func showBubbleViewAndLabel() {
        let frame = CGRect(x: self.view.center.x - 75, y: self.view.center.y - 75, width: 150, height: 150)
        let bubble = BubbleView(frame: frame, color: UIColor.accentBlueColor(), textColor: UIColor.whiteColor(), text: BubbleData.ViewWillAppear)
        bubble.alpha = 0.0
        self.view.addSubview(bubble)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainPageViewController.bubbleTapped))
        bubble.addGestureRecognizer(tapGesture)
        
        UIView.animateWithDuration(1.0, animations: {
            self.labelStackView.alpha = 1.0
            bubble.alpha = 1.0
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
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.delegate = self
        let _ = scrollView.bubbles.map { $0.delegate = self }
        registerForPreviewingWithDelegate(self, sourceView: self.scrollView)
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
    func bubbleViewPressed(view: BubbleView, segueIdentifier: String) {
        selectedView = view
        performSegueWithIdentifier(segueIdentifier, sender: self)
    }
}

extension MainPageViewController: UIScrollViewDelegate {
    
}

extension MainPageViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print(location)
        let views = scrollView.bubbles.filter { CGRectContainsPoint($0.frame, location)}
        if let view = views.first {
            previewingContext.sourceRect = view.frame
            
            print(view.text!.rawValue)
            let viewController = storyboard?.instantiateViewControllerWithIdentifier(view.text!.rawValue)
            return viewController
        }
        return nil
    }
}

extension MainPageViewController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .Pop:
            return DismissScaleAnimationController()
        case .Push:
            let scaleAnimator = ScaleAnimationController()
            scaleAnimator.originFrame = CGRect(origin: CGPoint(x: selectedView!.frame.origin.x - scrollView.contentOffset.x, y: selectedView!.frame.origin.y), size: selectedView!.frame.size)
            return scaleAnimator
        case .None:
            return nil
        }
    }
}

