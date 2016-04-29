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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = configureMainCircleView()
        self.view.addSubview(circleView)
        
        let percentage: CGFloat = CGFloat(Skills.Swift.percentage) / 100
        let barHeight = circleView.frame.height * percentage
        let origin = CGPoint(x: circleView.bounds.origin.x, y: circleView.bounds.maxY - barHeight / 2)
        let size = CGSize(width: circleView.frame.width, height: circleView.frame.height * percentage)
        
        let swiftView = SkillsView(frame: CGRect(origin: origin, size: size) , skill: Skills.Swift, backgroundColor: Skills.Swift.color)
        views.append(swiftView)
        
        let objectiveC = configureSkillView(Skills.ObjectiveC, previousView: swiftView, circleView: circleView)
        views.append(objectiveC)
        
        let cSharp = configureSkillView(Skills.CSharp, previousView: objectiveC, circleView: circleView)
        views.append(cSharp)
        
        let cPlusPlus = configureSkillView(Skills.CPlusPlus, previousView: cSharp, circleView: circleView)
        views.append(cPlusPlus)
        
        let python = configureView(Skills.Python, previousView: cPlusPlus, circleView: circleView)
        views.append(python)
        
        let javaScript = configureView(Skills.Javascript, previousView: python, circleView: circleView)
        views.append(javaScript)
    
        let _ = views.map {
            $0.delegate = self
            circleView.addSubview($0) }
    }
    
    
    private func configureView(skill: Skills, previousView: SkillsView, circleView: UIView) -> SkillsView {
        let percentage: CGFloat = CGFloat(skill.percentage) / 100
        let barHeight = circleView.frame.height * percentage
        let size = CGSize(width: circleView.frame.width, height: barHeight)
        let origin = CGPoint(x: circleView.bounds.origin.x, y: (previousView.frame.minY - barHeight / 2) - previousView.bounds.height / 2)
        
        print("bar Height in configureView \(barHeight); previousViewBounds \(previousView.bounds.height)")
        
        return SkillsView(frame: CGRect(origin: origin, size: size), skill: skill, backgroundColor: skill.color)
    }
    
    private func configureSkillView(skill: Skills, previousView: SkillsView, circleView: UIView) -> SkillsView {
        let percentage: CGFloat = CGFloat(skill.percentage) / 100
        let barHeight = circleView.frame.height * percentage
        let size = CGSize(width: circleView.frame.width, height: barHeight)
        let origin = CGPoint(x: circleView.bounds.origin.x, y: (previousView.frame.minY - barHeight) - barHeight / 2 )
        
        print("bar Height in skillsView \(barHeight); previousViewBounds \(previousView.bounds.height)")
        
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
        print("\(view.skill?.rawValue) tapped")
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
        print("animation ended")
    }
}
