//
//  MainPageScrollView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/17/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

protocol MainPageScrollViewDelegate: class {
    var scrollViewContentSize: CGSize { get }
    
}

class MainPageScrollView: UIScrollView {
   
    private var animator: UIDynamicAnimator!
    private var gravity: UIFieldBehavior!
    private var collision: UICollisionBehavior!
    
    weak var dataSource: MainPageScrollViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
