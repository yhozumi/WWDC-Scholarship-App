//
//  AboutMeCollectionCell.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/30/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class AboutMeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var aboutImageView: UIImageView!
    
    private var blurEffectView: UIVisualEffectView?
    
    private let margin: CGFloat = 20
    
    var about: About? {
        didSet {
            print("about set")
            descriptionLabel.text = about?.description
            aboutImageView.image = about?.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.width / 2 + margin
        descriptionLabel.alpha = 0.0
        configureTapGesture()
        configureBlurEffectWithEffectType(.Dark)
    }
    
    private func configureTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AboutMeCollectionCell.imageTapped))
        self.addGestureRecognizer(tap)
    }
    
    private func configureBlurEffectWithEffectType(type: UIBlurEffectStyle) -> UIVisualEffectView {
        let imageBlur = UIBlurEffect(style: type)
        let effectView = UIVisualEffectView(effect: imageBlur)
        effectView.frame = aboutImageView.frame
        effectView.alpha = 0.0
        aboutImageView.addSubview(effectView)
        
        return effectView
    }
    
    func imageTapped() {
        if blurEffectView == nil {
            blurEffectView = configureBlurEffectWithEffectType(.Light)
            UIView.animateWithDuration(0.5, animations: {
                self.blurEffectView!.alpha = 1.0
                self.descriptionLabel.alpha = 1.0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                if self.blurEffectView!.alpha == 0.0 {
                    self.blurEffectView!.alpha = 1.0
                    self.descriptionLabel.alpha = 1.0
                } else {
                    self.blurEffectView!.alpha = 0.0
                    self.descriptionLabel.alpha = 0.0
                }
                }, completion: nil)
        }
    }

    
}
