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
            return ""
        case .Hobby:
            return "On my free time I play my guitar or piano. I found out that playing music helps me relax and rethink the code I've written or come up with new ideas."
        }
    }
    
    var image: UIImage {
        switch self {
        case .Personal: return UIImage()
        case .Work: return UIImage()
        case .Code: return UIImage()
        case .Hobby: return UIImage()
        }
    }
    
    static func arrayOfAbouts() -> [About] {
        return [ About.Personal, About.Work, About.Code, About.Hobby ]
    }
}

