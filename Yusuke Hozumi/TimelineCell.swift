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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.alpha = 1.0
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let mainHeight: CGFloat = 250
        let regularHeight: CGFloat = 80
        
        let delta = 1 - ((mainHeight - CGRectGetHeight(frame)) / (mainHeight - regularHeight))
        
        let minAlpha: CGFloat = 0.35
        let maxAlpha: CGFloat = 0.85
        imageFilterView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
    }
}
