//
//  AboutMeViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/13/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private let margin: CGFloat = 20
    
    private let abouts = About.arrayOfAbouts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        
        let size = CGSize(width: self.view.frame.width - margin, height: self.view.frame.width - margin)
        let frame = CGRect(origin: CGPoint(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y), size: size)
        let view = AboutView(frame: frame, about: abouts[0])
        view.center.y = scrollView.center.y
        self.view.addSubview(view)
    }
    
    private func configureScrollView() {
        let origin = CGPointZero
        let size = CGSize(width: self.view.frame.width - margin, height: self.view.frame.width)
        scrollView = UIScrollView(frame: CGRect(origin: origin, size: size))
        scrollView.contentSize = CGSize(width: (self.view.frame.width * 4) - (margin * 8), height: size.height - margin * 4)
        scrollView.layer.cornerRadius = scrollView.bounds.width / 2
        scrollView.center = self.view.center
        scrollView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(scrollView)
    }
}
