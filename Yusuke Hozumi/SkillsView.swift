//
//  SkillsView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import QuartzCore

protocol SkillsViewDelegate: class {
    func skillsViewDidPress(view: SkillsView)
    func skillsViewAnimationEnded(view: SkillsView)
}

class SkillsView: UIView {
    
    private(set) var skill: Skills?
    
    private(set) var filterView: UIView?
    
    weak var delegate: SkillsViewDelegate?

    convenience init(frame: CGRect, skill: Skills, backgroundColor: UIColor) {
        self.init(frame: frame)
        self.skill = skill
        self.backgroundColor = backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        configureHeightAimation()
    }
    
    private func configureFilterView() {
        filterView = UIView(frame: self.bounds)
        filterView?.backgroundColor = UIColor.blackColor()
        filterView?.alpha = 0.0
        self.addSubview(filterView!)
    }
    
    private func configureHeightAimation() {
        let heightAnimation = CABasicAnimation(keyPath: "bounds.size.height")
        let oldHeight = CGRectZero.height
        let newHeight = self.frame.height
        heightAnimation.fromValue = NSNumber(float: Float(oldHeight))
        heightAnimation.toValue = NSNumber(float: Float(newHeight))
        heightAnimation.duration = 1.5
        heightAnimation.delegate = self
        layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.addAnimation(heightAnimation, forKey: "Height-Animation")
    }
    
    private func configureNameLabel() {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: self.skill!.rawValue, attributes: [NSFontAttributeName: UIFont(name: "menlo", size: 16)!])
        label.sizeToFit()
        label.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        label.textColor = UIColor.whiteColor()
        label.alpha = 0.0
        self.addSubview(label)
        
        UIView.animateWithDuration(0.4, animations: {
            label.alpha = 1.0
            }, completion: { _ in
                self.delegate?.skillsViewAnimationEnded(self)
                self.configureFilterView()
        })
    }
    
    private func setUpTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SkillsView.skillTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    func skillTapped() {
        self.delegate?.skillsViewDidPress(self)
    }
}

extension SkillsView {
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        configureNameLabel()
        setUpTapGesture()
    }
}
