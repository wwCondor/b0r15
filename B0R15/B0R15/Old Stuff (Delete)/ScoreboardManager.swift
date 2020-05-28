//
//  ScoreboardLauncher.swift
//  B0R15
//
//  Created by Wouter Willebrands on 25/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreboardManager: NSObject {
    
    let fadeView = UIView()
    
    lazy var scoreboard: Scoreboard = {
        let scoreboard = Scoreboard()
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissScoreboard(sender:)))
        swipeDownGesture.direction = .down
        scoreboard.addGestureRecognizer(swipeDownGesture)
        scoreboard.backgroundColor = UIColor(named: Colors.scoreBoardBG.name)
        scoreboard.layer.masksToBounds = true
        return scoreboard
    }()
        
    func presentScoreboard() {
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow } // handles deprecated warning for multiple screens

        if let window = window {

            window.addSubview(fadeView)
            window.addSubview(scoreboard)
            
            fadeView.frame = window.frame
            fadeView.alpha = 0
            fadeView.backgroundColor = UIColor.clear
            fadeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissScoreboard(sender:))))
            
            let scoreboardWidth = window.frame.width * (7/8)
            let scoreboardHeigth = window.frame.height * (1/4)
            let xOffset = (window.frame.width - scoreboardWidth) / 2
            let yOffset = window.frame.height
            scoreboard.frame = CGRect(x: xOffset, y: yOffset, width: scoreboardWidth, height: scoreboardHeigth)
            
            // This handles rounding off only the indicated corners ->
            let maskPath = UIBezierPath(roundedRect: scoreboard.bounds,
                                        byRoundingCorners: [.topLeft, .topRight],
                                        cornerRadii: CGSize(width: Constants.scoreboardCornerRadius, height: Constants.scoreboardCornerRadius))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            scoreboard.layer.mask = shape
            // <-
            
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.fadeView.alpha = 1
                    self.scoreboard.center.y -= self.scoreboard.bounds.height
            },
                completion: nil)
        }
    }
        
    @objc private func dismissScoreboard(sender: UISwipeGestureRecognizer) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.fadeView.alpha = 0
                self.scoreboard.center.y += self.scoreboard.bounds.height
        },
            completion: nil)
        
    }
    
    override init() {
        super.init()
    }
    
}


 
