//
//  UINavigationController+InvisibleNav.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/17/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class UINavigationController_InvisibleNav: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(self.navigationBar)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func configureNavigationBar(bar: UINavigationBar) {
        bar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        bar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "menlo", size: 15)!, NSForegroundColorAttributeName: UIColor.commentGreenColor()]
        bar.backgroundColor = UIColor.darkBackGroundColor()
        bar.shadowImage = UIImage()
        bar.tintColor = UIColor.commentGreenColor()
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "menlo", size: 15)!], forState: .Normal)
    }
    
    
}
