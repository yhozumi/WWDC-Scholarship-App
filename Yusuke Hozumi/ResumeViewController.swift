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

    private let url: NSURL? = NSURL(string:
        "https://www.yusukehozumi.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = url else { return }
        loadSafariViewController(url)
    }
    
    private func loadSafariViewController(url: NSURL) {
        let safariVC = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
        safariVC.delegate = self
        presentViewController(safariVC, animated: false, completion: nil)
    }
}

extension ResumeViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        self.navigationController?.popViewControllerAnimated(false)
    }
}
