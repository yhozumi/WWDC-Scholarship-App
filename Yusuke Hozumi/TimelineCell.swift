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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.alpha = 1.0
    }
}
