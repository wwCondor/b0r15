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
            
            let scoreboardWidth = window.frame.height * (5/6)
            let scoreboardHeigth = window.frame.height * (1/3)
            let y = window.frame.height
            scoreboard.frame = CGRect(x: 0, y: y, width: scoreboardWidth, height: scoreboardHeigth)
            
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
 
