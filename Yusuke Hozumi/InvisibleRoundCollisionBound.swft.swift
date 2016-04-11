//
//  InvisibleRoundCollisionBound.swft.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/10/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class InvisibleRoundCollisionBound: UIView {
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
