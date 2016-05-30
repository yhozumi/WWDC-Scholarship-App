//
//  KenzieViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 5/1/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import QuartzCore

class KenzieViewController: UIViewController {
    @IBOutlet weak var kenzieImageView: UIImageView!
    @IBOutlet weak var kenzieLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.kenzieImageView.layer.cornerRadius = self.kenzieImageView.bounds.width / 2
        self.kenzieImageView.clipsToBounds = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView(kenzieImageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.kenzieImageView.center.y = self.view.frame.height / 2
    }
    
    private func animateImageView(image: UIImageView) {
        let dropAnimation = CABasicAnimation(keyPath: "center.y")
        dropAnimation.duration = 0.5
        dropAnimation.fromValue = self.view.frame.height / 2
        dropAnimation.toValue = image.center.y
        
        image.layer.addAnimation(dropAnimation, forKey: "dropAnimation")
    }
}
