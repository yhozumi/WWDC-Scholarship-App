//
//  ResumeViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/27/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import SafariServices


class ResumeViewController: UIViewController {
    
    override func viewDidLoad() {
        loadSafariViewControllerWithURL(url)
    }
}

extension ResumeViewController: SafariViewControllerViewable {
    var url: NSURL {
        return NSURL(string: "https://docs.google.com/document/d/13AkD6gQbx8vb_v9zjXGsTAzUGo1Q_c6XiKxAejnpKyU/edit?usp=sharing")!
    }
}

extension ResumeViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        self.navigationController?.popViewControllerAnimated(false)
    }
}
