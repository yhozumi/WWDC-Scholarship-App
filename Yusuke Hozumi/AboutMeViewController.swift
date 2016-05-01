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
        
        let secondView = AboutView(frame: frame, about: abouts[1])
        secondView.frame.origin.x = self.view.frame.width - margin
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
        scrollView.backgroundColor = UIColor.darkBackGroundColor()
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        
        print("scrollView center \(scrollView.center), scrollView frame origin \(scrollView.frame.origin)")
        self.view.addSubview(scrollView)
    }
}

extension AboutMeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
}
