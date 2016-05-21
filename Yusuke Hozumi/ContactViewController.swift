//
//  ContactViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/14/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController {
    
    @IBOutlet weak var contactImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureContactImageView(contactImageView)
    }
    
    private func configureContactImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
    }
    
    private func displayErrorMessage() {
        let alert = UIAlertController(title: "Cannot send email", message: "Something went wrong and cannot send Email.", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    private func configureMailComposeViewController(recipient: String, subject: String = "", body: String = "") {
        let composeMailVC = MFMailComposeViewController()
        composeMailVC.mailComposeDelegate = self
        
        composeMailVC.setToRecipients([recipient])
        composeMailVC.setSubject(subject)
        composeMailVC.setMessageBody(body, isHTML: false)
        
        self.presentViewController(composeMailVC, animated: true, completion: nil)
    }

    @IBAction func emailButtonPressed(sender: AnyObject) {
        guard MFMailComposeViewController.canSendMail() else { displayErrorMessage(); return }
    
        configureMailComposeViewController("yusuke.hozumi@icloud.com")
        
    }
}

extension ContactViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}