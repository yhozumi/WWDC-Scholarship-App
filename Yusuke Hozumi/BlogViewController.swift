//
//  BlogViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/27/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import SafariServices

class BlogViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSafariViewControllerWithURL(url)
    }
}

extension BlogViewController: SafariViewControllerViewable {
    var url: NSURL {
        return NSURL(string: "http://www.yusukehozumi.com")!
    }
}

extension BlogViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        self.navigationController?.popViewControllerAnimated(false)
    }
}