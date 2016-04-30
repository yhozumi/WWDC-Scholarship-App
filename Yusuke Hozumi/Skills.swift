//
//  Skills.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import Foundation

enum Skills: String {
    case Swift = "Swift"
    case CSharp = "C#"
    case ObjectiveC = "Objective-C"
    case CPlusPlus = "C/C++"
    case Python = "Python"
    case Javascript = "Javascript"
    
    var description: String {
        switch self {
        case Swift:
            return "I have been working on Swift Programming language since March of 2015. It's the first programming language I actually enjoy learning and applying. I spend most of my time playing with Swift."
        case .CSharp:
            return "C# is the first programming language I learned. I took a class on beginning programming course. C# tought me how to write Object-Oriented programming"
        case .ObjectiveC:
            return "I spent a little bit of time learning Objective-C since Swift is still new not all companies and projects are done on Swift. Objective-C is unique and a lot of people stay away from this language because it's very different but once you understand the syntax it's an amazing language."
        case .CPlusPlus:
            return "Took some time looking over iTunes U courses for C and C++."
        case .Python:
            return "My goal was to work at Apple Corporate some day and I heard that they use Python as automation scripting language so I learned this language."
        case .Javascript:
            return "I took Javascript as a course in college. I also took the time to learn a little bit of UI automation in Apple Script."
        }
    }
    
    var percentage: Int {
        switch  self {
        case .Swift: return 40
        case .ObjectiveC: return 20
        case .CSharp: return 10
        case .CPlusPlus: return 5
        case .Python: return 15
        case .Javascript: return 10
        }
    }
    
    var color: UIColor {
        switch self {
        case .Swift: return UIColor.commentGreenColor()
        case .ObjectiveC: return UIColor.accentOrangeColor()
        case .CSharp: return UIColor.accentRedColor()
        case .CPlusPlus: return UIColor.darkBackGroundColor()
        case .Python: return UIColor.accentBlueColor()
        case .Javascript: return UIColor.accentPurpleColor()
        }
    }
    
    static func arrayOfSkills() -> [Skills] {
        return [
            Skills.Swift,
            Skills.CSharp,
            Skills.ObjectiveC,
            Skills.CPlusPlus,
            Skills.Python,
            Skills.Javascript
        ]
    }
}