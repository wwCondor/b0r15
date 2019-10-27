//
//  PuzzleBoardLauncher.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardLauncher: NSObject {
    
    var modeSelected: GameMode?
    
    let fadeView = UIView()
    
    lazy var puzzleBoard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let scoreboard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scoreboard.backgroundColor = UIColor.systemIndigo
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzelBoard))
        swipeRightGesture.direction = .right
        scoreboard.addGestureRecognizer(swipeRightGesture)
        return scoreboard
    }()
    
    lazy var timerView: UIView = {
        let timerView = UIView()
        timerView.backgroundColor = UIColor.systemYellow
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzelBoard))
        swipeLeftGesture.direction = .left
        timerView.addGestureRecognizer(swipeLeftGesture)
        return timerView
    }()
        
    func showPuzzelBoard() {
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        if let window = window {
            
            guard let modeSelected = modeSelected else {
                return
            }
            
            if modeSelected == .modeOne {
                fadeView.backgroundColor = UIColor.systemPurple
            } else if modeSelected == .modeTwo {
                fadeView.backgroundColor = UIColor.systemTeal
            }
            
            
            window.addSubview(fadeView)
            window.addSubview(puzzleBoard)
            window.addSubview(timerView)
            
            fadeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPuzzelBoard)))
            fadeView.frame = window.frame
            fadeView.alpha = 0
            
            
            let timerWidth = window.frame.width
            let timerHeigth = window.frame.height * (1/4)
            let timerXOffset: CGFloat = -window.frame.width
            let timerYOffset: CGFloat = window.frame.height * (3/4)
            timerView.frame = CGRect(x: timerXOffset, y: timerYOffset, width: timerWidth, height: timerHeigth)
            
            let puzzleBoardWidth = window.frame.width
            let puzzleBoardHeigth = window.frame.height * (3/4) - (puzzleBoardWidth / 16)
            let boardXOffset: CGFloat = window.frame.width
            let boardYOffset: CGFloat = 0
            puzzleBoard.frame = CGRect(x: boardXOffset, y: boardYOffset, width: puzzleBoardWidth, height: puzzleBoardHeigth)
            
            let cornerRadii = puzzleBoardWidth / 16 // this matches curves of scoreboard
            let maskPath = UIBezierPath(roundedRect: puzzleBoard.bounds,
                                        byRoundingCorners: [.bottomLeft],
                                        cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            puzzleBoard.layer.mask = shape
            puzzleBoard.layer.masksToBounds = true

            let timerMaskPath = UIBezierPath(roundedRect: timerView.bounds,
                                             byRoundingCorners: [.topRight],
                                             cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
            let timerShape = CAShapeLayer()
            timerShape.path = timerMaskPath.cgPath
            timerView.layer.mask = timerShape
            timerView.layer.masksToBounds = true
            
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.fadeView.alpha = 1
                    self.timerView.center.x += self.timerView.bounds.width
                    self.puzzleBoard.center.x -= self.puzzleBoard.bounds.width
            },
                completion: nil)
        }
    }
        
    @objc func dismissPuzzelBoard() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.fadeView.alpha = 0
                self.puzzleBoard.center.x += self.puzzleBoard.bounds.width
                self.timerView.center.x -= self.timerView.bounds.width

        },
            completion: nil)
        
    }
    
    override init() {
        super.init()
    }
    
}
 
