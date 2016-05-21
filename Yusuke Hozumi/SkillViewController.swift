//
//  SkillViewController.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/27/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let skills = Skills.arrayOfSkills()
    
    private var views = [SkillsView]()
    
    private var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleView = configureMainCircleView()
        self.view.addSubview(circleView!)

        configureMultipleSkillViews()
        let _ = views.map {
            $0.delegate = self
            circleView.addSubview($0) }
    }
    
    private func configureMultipleSkillViews() {
        var previousView: SkillsView?
        for skill in skills {
            switch skill {
            case .Swift:
                let percentage: CGFloat = CGFloat(Skills.Swift.percentage) / 100
                let barHeight = circleView.frame.height * percentage
                let origin = CGPoint(x: circleView.bounds.origin.x, y: circleView.bounds.maxY - barHeight / 2)
                let size = CGSize(width: circleView.frame.width, height: circleView.frame.height * percentage)
                
                let swiftView = SkillsView(frame: CGRect(origin: origin, size: size), skill: skill, backgroundColor: skill.color)
                views.append(swiftView)
                previousView = swiftView
            default:
                let skillView = configureSkillView(skill, previousView: previousView!, circleView: self.circleView)
                previousView = skillView
                views.append(skillView)
            }
        }
    }

    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SkillViewController.screenTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func screenTapped(gesture: UITapGestureRecognizer) {
        if !CGRectContainsPoint(circleView!.frame, gesture.locationInView(self.view)) {
            UIView.animateWithDuration(0.5, animations: {
                self.descriptionLabel.alpha = 0.0
                let _ = self.views.map { $0.filterView!.alpha = 0.0 }
            })
        }
    }
    
    private func configureSkillView(skill: Skills, previousView: SkillsView, circleView: UIView) -> SkillsView {
        let percentage: CGFloat = CGFloat(skill.percentage) / 100
        let barHeight = circleView.frame.height * percentage
        let size = CGSize(width: circleView.frame.width, height: barHeight)
        let origin = CGPoint(x: circleView.bounds.origin.x, y: (previousView.frame.minY - barHeight / 2) - previousView.bounds.height / 2)
        
        print("bar Height in configureView \(barHeight); previousViewBounds \(previousView.bounds.height)")
        
        return SkillsView(frame: CGRect(origin: origin, size: size), skill: skill, backgroundColor: skill.color)
    }
    
    private func configureMainCircleView() -> UIView {
        let topViewWidth = self.view.frame.width
        let topViewHeight = self.view.frame.height
        let margin: CGFloat = 20.0
        
        let viewSize = CGSize(width: topViewWidth - margin, height: topViewWidth - margin)
        let origin = CGPoint(x: topViewWidth / 2 - viewSize.width / 2, y: topViewHeight / 2 - viewSize.height / 2)
        
        let circleView = UIView(frame: CGRect(origin: origin, size: viewSize))
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        circleView.backgroundColor = UIColor.whiteColor()
        circleView.clipsToBounds = true
        
        return circleView
    }
}

extension SkillViewController: SkillsViewDelegate {
    func skillsViewDidPress(view: SkillsView) {
        var viewsCopy = views
        UIView.animateWithDuration(0.5, animations: {
            let _ = viewsCopy.map { $0.filterView!.alpha = 0.0 }
            self.descriptionLabel.alpha = 0.0
            }, completion: { _ in
                let index = viewsCopy.indexOf(view)
                if let index = index {
                    viewsCopy.removeAtIndex(index)
                    let _ = viewsCopy.map { view in
                        UIView.animateWithDuration(0.5, animations: {
                            view.filterView!.alpha = 0.5
                            self.descriptionLabel.alpha = 1.0
                        })
                    }
                }
                self.descriptionLabel.text = view.skill?.description
        })
    }
    
    func skillsViewAnimationEnded(view: SkillsView) {
        configureTapGesture()
    }
}
