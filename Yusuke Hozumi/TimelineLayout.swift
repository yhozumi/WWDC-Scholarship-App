//
//  TimelineLayout.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/21/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class TimelineLayout: UICollectionViewLayout {
    private(set) var cache = [UICollectionViewLayoutAttributes]()
    
    private var dragOffset: CGFloat = 200
    
    private var leftSideWidth: CGFloat {
        return CGRectGetWidth(collectionView!.bounds) - width
    }
    
    private var mainCellIndex: Int {
        return max(0, Int(collectionView!.contentOffset.y / dragOffset))
    }
    
    private var nextCellOffset: CGFloat {
        return collectionView!.contentOffset.y / dragOffset - CGFloat(mainCellIndex)
    }
    
    private var width: CGFloat {
        return CGRectGetWidth(collectionView!.bounds) * 0.85
    }
    
    private var height: CGFloat {
        return CGRectGetHeight(collectionView!.bounds)
    }
    
    private var numberOfItems: Int {
        return collectionView!.numberOfItemsInSection(0)
    }
    
    private var cellsCenterY: CGFloat?
    
    override func collectionViewContentSize() -> CGSize {
        let contentHeight = CGFloat(numberOfItems) * dragOffset + (height - dragOffset)
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepareLayout() {
        cache.removeAll(keepCapacity: false)
        
        let regularHeight: CGFloat = 80
        let mainHeight: CGFloat = 250
        
        var frame = CGRectZero
        var y: CGFloat = 0.0
        
        for item in 0..<numberOfItems {
            let indexPath = NSIndexPath(forItem: item, inSection: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            
            attribute.zIndex = item
            var height = regularHeight
            
            if indexPath.item == mainCellIndex {
                let yOffset = regularHeight * nextCellOffset
                y = collectionView!.contentOffset.y - yOffset
                height = mainHeight
            } else if indexPath.item == (mainCellIndex + 1) && indexPath.item != numberOfItems {
                let maxY = y + regularHeight
                height = regularHeight + max((mainHeight - regularHeight) * nextCellOffset, 0)
                y = maxY - height
            }
            
            frame = CGRect(x: 0 + (CGRectGetWidth(collectionView!.bounds) - width), y: y + 10, width: width, height: height)
            attribute.frame = frame
            cache.append(attribute)
            y = CGRectGetMaxY(frame)
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        let _ = cache.map {
            if CGRectIntersectsRect($0.frame, rect) {
                layoutAttributes.append($0)                
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}