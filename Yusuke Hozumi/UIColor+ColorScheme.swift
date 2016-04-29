//
//  UIColor+ColorScheme.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/26/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import Foundation

extension UIColor {
    static func accentBlueColor() -> UIColor {
        return UIColor(red: 26.0/255.0, green: 170.0/255.0, blue: 163.0/255.0, alpha: 1.0)
    }
    
    static func darkBackGroundColor() -> UIColor {
        return UIColor(red: 41.0/255.0, green: 44.0/255.0, blue: 54.0/255.0, alpha: 1.0)
    }
    
    static func accentRedColor() -> UIColor {
        return UIColor(red: 219.0/255.0, green: 60.0/255.0, blue: 64.0/255.0, alpha: 1.0)
    }
    
    static func accentPurpleColor() -> UIColor {
        return UIColor(red: 135.0/255.0, green: 132.0/255.0, blue: 188.0/255.0, alpha: 1.0)
    }
    
    static func accentOrangeColor() -> UIColor  {
        return UIColor(red: 209.0/255.0, green: 141.0/255.0, blue: 97.0/255.0, alpha: 1.0)
    }
    
    static func commentGreenColor() -> UIColor {
        return UIColor(red: 89.0/255.0, green: 183.0/255.0, blue: 92.0/255.0, alpha: 1.0)
    }
    
    
    static func colorPalette() -> [UIColor] {
        return [UIColor.accentBlueColor(), UIColor.accentRedColor(), UIColor.accentPurpleColor(), UIColor.accentOrangeColor(), UIColor.commentGreenColor(), UIColor.whiteColor()]
    }
    
    static func bubbleTextColorPalette() -> [UIColor] {
        return [UIColor.accentRedColor(), UIColor.commentGreenColor(), UIColor.accentOrangeColor(), UIColor.accentPurpleColor(), UIColor.whiteColor(), UIColor.accentBlueColor()]
    }
}