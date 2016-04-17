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
    
    private func configureNavigationBar(bar: UINavigationBar) {
        bar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        bar.backgroundColor = .clearColor()
        bar.shadowImage = UIImage()
    }
}
