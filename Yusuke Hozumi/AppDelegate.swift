//
//  AppDelegate.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/28/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    enum ShortCutItems: String {
        case Timeline = "timeline"
        case Contact = "contact"
        case About = "about"
        case Skills = "skills"
        
        private var segueIdentifier: String {
            switch self {
            case .Timeline:
                return "showTimeline"
            case .Contact:
                return "showContact"
            case .About:
                return "showAbout"
            case .Skills:
                return "showSkills"
            }
        }
    }
    
    private func instantiateViewController(name: ShortCutItems) {
        let navigationVC = window?.rootViewController as! UINavigationController
        let mainVC = navigationVC.viewControllers.first as! MainPageViewController
        mainVC.performSegueWithIdentifier(name.segueIdentifier, sender: self)
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        let navigationVC = window?.rootViewController as! UINavigationController
        navigationVC.popViewControllerAnimated(true)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
    
        switch shortcutItem.type {
        case ShortCutItems.Timeline.rawValue:
            instantiateViewController(ShortCutItems.Timeline)
        case ShortCutItems.About.rawValue:
            instantiateViewController(ShortCutItems.About)
        case ShortCutItems.Contact.rawValue:
            instantiateViewController(ShortCutItems.Contact)
        case ShortCutItems.Skills.rawValue:
            instantiateViewController(ShortCutItems.Skills)
        default:
            return
        }
    }
}

