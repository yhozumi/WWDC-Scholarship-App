//
//  TimelineCell.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/21/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class TimelineCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageFilterView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let mainHeight: CGFloat = 250
        let regularHeight: CGFloat = 80
        
        let delta = 1 - ((mainHeight - CGRectGetHeight(frame)) / (mainHeight - regularHeight))
        
        let minFilterAlpha: CGFloat = 0.25
        let maxFilterAlpha: CGFloat = 0.75
    
        let minTextAlpha: CGFloat = 0.4
        let maxTextAlpha: CGFloat = 1.0
        
        imageFilterView.alpha = maxFilterAlpha - (delta * (maxFilterAlpha - minFilterAlpha))
        titleLabel.alpha = minTextAlpha - (delta * (minTextAlpha - maxTextAlpha))
        dateLabel.alpha = minTextAlpha - (delta * (minTextAlpha - maxTextAlpha))
        descriptionLabel.alpha = delta
    }
}
