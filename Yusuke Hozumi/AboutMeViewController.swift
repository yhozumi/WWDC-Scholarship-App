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
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let frame = CGRect(origin: CGPointZero, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.width))
        let aboutView = AboutView(frame: frame, about: abouts[0])
        scrollView.addSubview(aboutView)
        
        let secondFrame = CGRect(origin: CGPoint(x: scrollView.frame.width , y: 0), size: CGSize(width: scrollView.frame.width, height: scrollView.frame.width))
        let secondView = AboutView(frame: secondFrame, about: abouts[1])
        scrollView.addSubview(secondView)
        
    }
    
    private func configureScrollView() {
        let origin = CGPointZero
        let width = self.view.frame.width - margin
        let size = CGSize(width: width, height: width)
        scrollView = UIScrollView(frame: CGRect(origin: origin, size: size))
        scrollView.contentSize = CGSize(width: width * 4, height: width)
        scrollView.center = self.view.center
        scrollView.layer.cornerRadius = scrollView.frame.width / 2
        scrollView.showsHorizontalScrollIndicator = false
        
        print("scrollView center \(scrollView.center), scrollView frame origin \(scrollView.frame.origin)")
        scrollView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(scrollView)
    }
}
