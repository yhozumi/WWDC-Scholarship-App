//
//  TimelineCollectionViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/21/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class TimelineCollectionViewController: UICollectionViewController {
    
    private let events = [TimelineEvent]()
    private var json: AnyObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .whiteColor()
        
        let frame = CGRect(x: 0, y: 60, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.backgroundColor = .whiteColor()
        collectionView!.frame = frame
        
        parseJSON()
    }
    
    private func parseJSON() {
        guard let path = NSBundle.mainBundle().pathForResource("TimelineEvents", ofType: "json") else { return }
        let data = NSData(contentsOfURL: NSURL(fileURLWithPath: path, isDirectory: true))
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            print(json)
        } catch {
            print("error reading json")
        }
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! TimelineCell
        
        return cell
    }
}