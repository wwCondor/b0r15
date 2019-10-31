//
//  ScoreboardLauncher.swift
//  B0R15
//
//  Created by Wouter Willebrands on 25/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreboardLauncher: NSObject {
    
    let scoreCellId = "cellId"
    
//    lazy var fadeView: UIView = {
//        let fadeView = UIView()
//        fadeView.backgroundColor = UIColor.blue
//        fadeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissScoreboard(sender:))))
//        return fadeView
//    }()
    
    let fadeView = UIView()

    lazy var scoreboard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let scoreboard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissScoreboard(sender:)))
        swipeDownGesture.direction = .down
        scoreboard.addGestureRecognizer(swipeDownGesture)
        scoreboard.backgroundColor = UIColor.systemPink
        scoreboard.register(ScoreboardCell.self, forCellWithReuseIdentifier: scoreCellId)
        scoreboard.dataSource = self
        scoreboard.delegate = self
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
            fadeView.backgroundColor = UIColor.blue
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

extension ScoreboardLauncher: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Number of cell per row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = scoreboard.frame.width * (3/4)
        let cellHeigth = scoreboard.frame.height / 6
        return CGSize(width: cellWidth, height: cellHeigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scoreboard.dequeueReusableCell(withReuseIdentifier: scoreCellId, for: indexPath) as! ScoreboardCell

        return cell
    }
    
}
 
