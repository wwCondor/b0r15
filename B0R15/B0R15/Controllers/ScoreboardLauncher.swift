//
//  ScoreboardLauncher.swift
//  B0R15
//
//  Created by Wouter Willebrands on 25/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreboardLauncher: NSObject {
    
    let fadeView = UIView()
    
    lazy var scoreboard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let scoreboard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scoreboard.backgroundColor = UIColor.systemPink
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissScores))
        swipeDownGesture.direction = .down
        scoreboard.addGestureRecognizer(swipeDownGesture)
        return scoreboard
    }()
        
    func showScores() {
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow } // this handles the deprecated warning for multiple screens
        
        if let window = window {
            fadeView.backgroundColor = UIColor.clear
            fadeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissScores)))
            
            window.addSubview(fadeView)
            window.addSubview(scoreboard)
            
            fadeView.frame = window.frame
            fadeView.alpha = 0
            
            let scoreboardWidth = window.frame.width * (7/8)
            let scoreboardHeigth = window.frame.height * (1/4)
            
            // Since view is not full width we take screenWidth - scoreboardWidth
            // That distance /2 gives the xOffset needed to center it
            let xOffset = (window.frame.width - scoreboardWidth) / 2
            
            // Since we don't want the slider at the top of the screen the yOffset is a full screen's heigth
            let yOffset = window.frame.height
            scoreboard.frame = CGRect(x: xOffset, y: yOffset, width: scoreboardWidth, height: scoreboardHeigth)
            
            // This handles rounding off only the indicated corners ->
            let maskPath = UIBezierPath(roundedRect: scoreboard.bounds,
                                        byRoundingCorners: [.topLeft, .topRight],
                                        cornerRadii: CGSize(width: xOffset, height: xOffset))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            scoreboard.layer.mask = shape
            // <-
            scoreboard.layer.masksToBounds = true
            
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
        
    @objc func dismissScores() {
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
 
