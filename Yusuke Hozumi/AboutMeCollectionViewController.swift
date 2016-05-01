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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension AboutMeCollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("aboutCell", forIndexPath: indexPath) as! AboutMeCollectionCell
        cell.about = abouts[indexPath.row]
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
}