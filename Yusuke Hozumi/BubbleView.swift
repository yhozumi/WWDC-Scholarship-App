//
//  BubbleView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    private(set) var color: UIColor?
    private(set) var text: String?

    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
    
    convenience init(frame: CGRect, color: UIColor, text: String) {
        self.init(frame: frame)
        self.color = color
        self.text = text
        configureBubbleView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBubbleView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = color
        
    }
}
