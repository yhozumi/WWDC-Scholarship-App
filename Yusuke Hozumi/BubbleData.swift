//
//  BubbleData.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import Foundation

enum BubbleData: String {
    case Timeline = "Timeline"
    case About = "About"
    case Contact = "Contact Me"
    case Skills = "Skills"
    case Resume = "Resumè"
    case Blog = "Blog"
    case ViewWillAppear = "viewWillAppear()"
    
    var segueIdentifier: String {
        switch self {
        case .Timeline:
            return "showTimeline"
        case About:
            return "showAbout"
        case Contact:
            return "showContact"
        case Skills:
            return "showSkills"
        case Resume:
            return "showResume"
        case Blog:
            return "showBlog"
        default:
            return ""
        }
    }
}
