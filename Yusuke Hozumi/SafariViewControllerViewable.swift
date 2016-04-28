//
//  SafariViewControllerViewable.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/27/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import SafariServices

protocol SafariViewControllerViewable: class, SFSafariViewControllerDelegate {
    var url: NSURL { get }
    func loadSafariViewControllerWithURL(url: NSURL)
}

extension SafariViewControllerViewable where Self: UIViewController {
    func loadSafariViewControllerWithURL(url: NSURL) {
        let safariVC = SFSafariViewController(URL: url)
        safariVC.delegate = self
        self.presentViewController(safariVC, animated: false, completion: nil)
    }
}
