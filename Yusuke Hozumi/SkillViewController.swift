//
//  SkillViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/27/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewSize = CGSize(width: self.view.frame.width - 20, height: self.view.frame.width - 20)
        let circleView = UIView(frame: CGRect(x: self.view.frame.width / 2 - viewSize.width / 2 , y: self.view.frame.height / 2 - viewSize.width / 2, width: viewSize.width, height: viewSize.height))
        circleView.backgroundColor = .whiteColor()
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        self.view.addSubview(circleView)
        circleView.clipsToBounds = true
        
        let swiftView = UIView(frame: CGRect(origin: CGPoint(x: circleView.bounds.origin.x, y: circleView.bounds.origin.y), size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 0.4)))
        swiftView.backgroundColor = UIColor.commentGreenColor()
        swiftView.layer.zPosition = 5
        circleView.addSubview(swiftView)
        
        let objec = UIView(frame: CGRect(origin: circleView.bounds.origin, size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 0.6)))
        objec.backgroundColor = UIColor.accentOrangeColor()
        objec.layer.zPosition = 4
        circleView.addSubview(objec)
        
        let cSharp = UIView(frame: CGRect(origin: circleView.bounds.origin, size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 0.7)))
        cSharp.backgroundColor = UIColor.accentRedColor()
        cSharp.layer.zPosition = 3
        circleView.addSubview(cSharp)
        
        let cCPlusPlus = UIView(frame: CGRect(origin: circleView.bounds.origin, size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 0.75)))
        cCPlusPlus.backgroundColor = UIColor.whiteColor()
        cCPlusPlus.layer.zPosition = 2
        circleView.addSubview(cCPlusPlus)
        
        let python = UIView(frame: CGRect(origin: circleView.bounds.origin, size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 0.95)))
        python.backgroundColor = UIColor.accentBlueColor()
        python.layer.zPosition = 1
        circleView.addSubview(python)
        
        let javaScript = UIView(frame: CGRect(origin: circleView.bounds.origin, size: CGSize(width: circleView.frame.width, height: circleView.frame.height * 1.0)))
        javaScript.backgroundColor = UIColor.accentPurpleColor()
        javaScript.layer.zPosition = 0
        circleView.addSubview(javaScript)
    }
}
