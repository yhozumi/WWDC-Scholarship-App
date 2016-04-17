//
//  MainPageViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

let pastelRed = UIColor(red: 253.0/255.0, green: 49.0/255.0, blue: 89.0/255.0, alpha: 1.0)

class MainPageViewController: UIViewController {
    private var scrollView: MainPageScrollView!
    private var animator: UIDynamicAnimator!
    @IBOutlet weak var helloLabel: UILabel!
    
    //Create an Enum or Structs with these later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        
    }
    
    
        
    private func setUpScrollView() {
        scrollView = MainPageScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 1.5, height: self.view.bounds.height)
        print(scrollView.center)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
}

extension MainPageViewController {

}

extension MainPageViewController: BubbleViewDelegate {
    //Most Likely break in the future, -- Find a better way --
    func bubbleViewPressed(name: String) {
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(name)
        self.navigationController!.pushViewController(viewController!, animated: true)
        print("\(name) instantiated")
    }
}

extension MainPageViewController: UIScrollViewDelegate {
    
}

