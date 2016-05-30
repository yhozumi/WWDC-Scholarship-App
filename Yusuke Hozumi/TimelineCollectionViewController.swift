//
//  TimelineCollectionViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/21/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class TimelineCollectionViewController: UICollectionViewController {
    
    private var events = [TimelineEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        parseJSON()
    }
    
    private func configureCollectionView() {
        let frame = CGRect(x: 0, y: 60, width: self.view.bounds.width, height: self.view.bounds.height)
        self.collectionView?.backgroundColor = UIColor.darkBackGroundColor()
        self.collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
        self.view.backgroundColor = UIColor.darkBackGroundColor()
        self.collectionView!.frame = frame
    }
    
    private func parseJSON() {
        guard let jsonDataPath = NSBundle.mainBundle().pathForResource("TimelineEvents", ofType: "json") else { return }
        guard let jsonData = NSData(contentsOfFile: jsonDataPath) else { print("bad data"); return }
        events = TimelineEvent.parseJSON(jsonData)!
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
        return events.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! TimelineCell
        let event = events[indexPath.row]
        
        cell.titleLabel.text = event.title
        cell.dateLabel.text = event.date
        cell.descriptionLabel.text = event.description
        cell.imageView.image = UIImage(named: event.image)
        
        return cell
    }
}