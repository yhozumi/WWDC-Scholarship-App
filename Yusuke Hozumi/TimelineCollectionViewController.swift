//
//  TimelineCollectionViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/21/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class TimelineCollectionViewController: UICollectionViewController {
    
    private let colors = UIColor.palette()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .whiteColor()
        
        let frame = CGRect(x: 0, y: 44, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.backgroundColor = .whiteColor()
        collectionView!.frame = frame
    }
 
}

//TimelineCollectionViewController DataSource
extension TimelineCollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 12
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}