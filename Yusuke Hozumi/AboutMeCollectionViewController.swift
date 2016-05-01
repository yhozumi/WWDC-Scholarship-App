//
//  AboutMeCollectionViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/30/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit


class AboutMeCollectionViewController: UICollectionViewController {

    private let abouts = About.arrayOfAbouts()
    private let margin: CGFloat = 20
    private var pageControl: UIPageControl?
    private var currentPage: Int = 0
    private var categoryLabel: UILabel!
    private var midYPoint: CGFloat?
    
    private var categoryText: String? {
        didSet {
            adjustCategoryLabelWithText(categoryText!)
            UIView.animateWithDuration(1.0, animations: {
                self.categoryLabel.alpha = 1.0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateMidYPoint()
        configurePageControl()
        configureCategoryLabel()
        
        categoryText = abouts[currentPage].rawValue
        self.title = "About"
    }
    
    private func adjustCategoryLabelWithText(text: String) {
        categoryLabel.attributedText = NSAttributedString(string: text, attributes: [NSFontAttributeName: UIFont(name: "Menlo", size: 25)!])
        categoryLabel.sizeToFit()
        categoryLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.x - midYPoint!)
        categoryLabel.textColor = abouts[currentPage].color
    }
    
    private func configureCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.alpha = 0.0
        categoryLabel.textAlignment = .Center
        
        self.view.insertSubview(categoryLabel, aboveSubview: self.collectionView!)
    }
    
    private func configurePageControl() {
        pageControl = UIPageControl()
        pageControl?.numberOfPages = 4
        pageControl?.center = CGPoint(x: self.view.center.x, y: self.view.frame.maxY - midYPoint!)
        self.view.insertSubview(pageControl!, aboveSubview: collectionView!)
    }
    
    private func calculateMidYPoint() {
        let maxY = self.view.frame.maxY
        let centerY = self.view.center.y
        let cellRadius = (self.view.frame.width - margin) / 2
        midYPoint = (maxY - (centerY + cellRadius)) / 2
    }
}

extension AboutMeCollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return abouts.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("aboutCell", forIndexPath: indexPath) as! AboutMeCollectionCell
        cell.about = abouts[indexPath.row]
        print("cell frame: \(cell.frame)")
        return cell
    }
}


extension AboutMeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - margin, height: self.view.frame.width - margin)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: margin / 2, bottom: 0, right: margin / 2)
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = self.collectionView!.frame.width
        currentPage = Int(self.collectionView!.contentOffset.x / pageWidth)
        pageControl?.currentPage = currentPage
        
        categoryText = abouts[currentPage].rawValue
    }
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(1.0, animations: {
            self.categoryLabel.alpha = 0.0
        })
    }
}
