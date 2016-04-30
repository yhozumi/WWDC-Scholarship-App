//
//  AboutView.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/29/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class AboutView: UIView {
    private var backgroundImageView: UIImageView?
    private var textLabel: UILabel?
    private var aboutLabel: UILabel?
    
    private var blurEffectView: UIVisualEffectView?
    
    private var about: About?
    
    convenience init(frame: CGRect, about: About) {
        self.init(frame: frame)
        self.about = about
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = UIColor.accentRedColor()
        configureBackgroundImageView(about!)
        //configureTextLabel(about!)
    }
    
    private func configureBackgroundImageView(about: About) {
        backgroundImageView = UIImageView(frame: self.frame)
        backgroundImageView!.layer.cornerRadius = backgroundImageView!.frame.width / 2
        backgroundImageView?.clipsToBounds = true
        backgroundImageView!.image = about.image
        
        configureTapGesture()
        self.addSubview(backgroundImageView!)
    }
    
    private func configureTextLabel(about: About) {
        textLabel = UILabel(frame: self.frame)
        textLabel!.attributedText = NSAttributedString(string: about.description, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15, weight: 200)])
        textLabel!.sizeToFit()
        textLabel?.translatesAutoresizingMaskIntoConstraints = true
        textLabel?.numberOfLines = 0
        textLabel!.center = CGPoint(x: self.center.x, y: self.center.y - self.center.y / 2)
        textLabel!.textColor = UIColor.blackColor()
        self.addSubview(textLabel!)
    }
    
    private func configureTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AboutView.imageTapped))
        self.addGestureRecognizer(tap)
    }
    
    private func configureBlurEffectWithEffectType(type: UIBlurEffectStyle) -> UIVisualEffectView {
        let imageBlur = UIBlurEffect(style: type)
        let effectView = UIVisualEffectView(effect: imageBlur)
        effectView.frame = backgroundImageView!.frame
        effectView.alpha = 0.0
        
        backgroundImageView?.addSubview(effectView)
        
        return effectView
    }
    
    func imageTapped() {
        if blurEffectView == nil {
            blurEffectView = configureBlurEffectWithEffectType(.Light)
            UIView.animateWithDuration(0.5, animations: {
                self.blurEffectView!.alpha = 1.0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                if self.blurEffectView!.alpha == 0.0 {
                    self.blurEffectView!.alpha = 1.0
                } else {
                    self.blurEffectView!.alpha = 0.0
                }
                }, completion: nil)
        }
    }
}
