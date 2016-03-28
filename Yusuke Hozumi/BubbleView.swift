//
//  BubbleView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    var bubbleViewColor: UIColor? = .redColor() {
        didSet {
            refreshUI()
        }
    }
    
    var bubbleViewRadius: CGFloat? {
        didSet {
            refreshUI()
        }
    }
    
    private func refreshUI() {
        self.backgroundColor = bubbleViewColor
        self.setNeedsDisplay()
    }
}
