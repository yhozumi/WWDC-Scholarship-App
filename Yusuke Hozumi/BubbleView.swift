//
//  BubbleView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

protocol BubbleViewDelegate: class {
    func bubbleViewPressed(view: BubbleView, segueIdentifier: String)
}

class BubbleView: UIView {
    private var label: UILabel!
    private(set) var color: UIColor?
    private(set) var textColor: UIColor?
    private(set) var text: BubbleData?
    
    weak var delegate: BubbleViewDelegate?

    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
    
    convenience init(frame: CGRect, color: UIColor, textColor: UIColor, text: BubbleData) {
        self.init(frame: frame)
        self.color = color
        self.textColor = textColor
        self.text = text
        configureBubbleView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        label = UILabel()
        label.attributedText = NSAttributedString(string: self.text!.rawValue, attributes: [NSFontAttributeName: UIFont(name: "Menlo-Bold", size: 15.0)!])
        label.textColor = textColor
        label.sizeToFit()
        label.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2)
        addSubview(label)
    }
    
    private func configureBubbleView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = color
        configureLabel()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(BubbleView.bubbleTapped(_:)))
        self.addGestureRecognizer(tap)
    }
    
    func bubbleTapped(tap: UITapGestureRecognizer) {
        delegate?.bubbleViewPressed(self, segueIdentifier: self.text!.segueIdentifier)
    }
}
