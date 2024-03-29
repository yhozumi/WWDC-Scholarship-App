//
//  About.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/29/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import Foundation

enum About: String {
    case Personal
    case Work
    case Code
    case Hobby

    var description: String {
        switch self {
        case .Personal:
            return "I was born in Japan and moved to United States. I grew up in a small town called Washington Court House, Ohio and later I moved to Columbus, Ohio. There I met my beautiful girlfriend, Mackenzie Stoyle. We are looking to move to New York City in the near future."
        case .Work:
            return "I currently work at an Apple Store as a Genius. I started working at Apple in November 11th, 2011. I started out as a Specialist which later was promoted to Genius position to repair relationships with customers. I love interacting with customers and solving their problems which lead me to realize that I love computer science and it is my passion."
        case .Code:
            return "Programming is my passon. I spend hours and hours everyday learning and trying out new things. Programming on Apple's Eco system is seriously a dream. I love my Apple products and it was life changing to see that I can make something unique and my ideas come to life through a small screen that everyone carries around. Thank you Apple."
        case .Hobby:
            return "On my free time I play my guitar or piano. I find that playing music helps me relax and rethink the code I've written or come up with new ideas."
        }
    }
    
    var image: UIImage {
        switch self {
        case .Personal: return UIImage(named: "kenz")!
        case .Work: return UIImage(named: "work")!
        case .Code: return UIImage(named: "code")!
        case .Hobby: return UIImage(named: "hobby")!
        }
    }
    
    var color: UIColor {
        switch self {
        case .Personal: return UIColor.accentOrangeColor()
        case .Work: return UIColor.accentPurpleColor()
        case .Code: return UIColor.accentRedColor()
        case .Hobby: return UIColor.accentBlueColor()
        }
    }
    
    static func arrayOfAbouts() -> [About] {
        return [ About.Personal, About.Work, About.Code, About.Hobby ]
    }
}

