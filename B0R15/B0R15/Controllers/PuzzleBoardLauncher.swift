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
    
    let backgroundView = UIView()
    let puzzleBoardCellId = "cellId"
//    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    
    lazy var puzzleBoardContainer: UIView = {
        let puzzleBoardContainer = UIView()
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard))
        puzzleBoardContainer.backgroundColor = UIColor.systemIndigo
        swipeRightGesture.direction = .right
        puzzleBoardContainer.addGestureRecognizer(swipeRightGesture)
        return puzzleBoardContainer
    }()
    
    lazy var puzzleBoard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        puzzleBoard.backgroundColor = UIColor.systemPink
        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
        puzzleBoard.dataSource = self
        puzzleBoard.delegate = self
        return puzzleBoard
    }()
    
    lazy var timerView: UIView = {
        let timerView = UIView()
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard))
        timerView.backgroundColor = UIColor.systemYellow
        swipeLeftGesture.direction = .left
        timerView.addGestureRecognizer(swipeLeftGesture)
        return timerView
    }()
    
        
    func showPuzzleBoard() {
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        guard let modeSelected = modeSelected else {
            return
        }
        
        if let window = window {
            
            if modeSelected == .modeOne {
                backgroundView.backgroundColor = UIColor.systemPurple
            } else if modeSelected == .modeTwo {
                backgroundView.backgroundColor = UIColor.systemTeal
            }
            
            window.addSubview(backgroundView)
            window.addSubview(puzzleBoardContainer)
            window.addSubview(puzzleBoard)
            window.addSubview(timerView)
                    
            backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard)))
            backgroundView.frame = window.frame
            backgroundView.alpha = 0
            
            let screenWidth = window.frame.width
            let screenHeigth = window.frame.height
            let padding = screenWidth / 16

            let timerViewHeigth = screenHeigth * (1/4)
            let timerViewXOffset: CGFloat = -screenWidth
            let timerViewYOffset: CGFloat = screenHeigth * (3/4)
            timerView.frame = CGRect(x: timerViewXOffset, y: timerViewYOffset, width: screenWidth, height: timerViewHeigth)
            
            let puzzleContainerHeigth = screenHeigth * (3/4) - padding
            let puzzleContainerXOffset: CGFloat = screenWidth
            let puzzleContainerYOffset: CGFloat = 0
            puzzleBoardContainer.frame = CGRect(x: puzzleContainerXOffset, y: puzzleContainerYOffset, width: screenWidth, height: puzzleContainerHeigth)
            print("puzzleContainer width:\(puzzleBoardContainer.frame.width) and height:\(puzzleBoardContainer.frame.height)")

            let puzzleBoardSize = screenWidth - (2 * padding)
            let puzzleBoardXOffset: CGFloat = screenWidth + padding
            let puzzleBoardYOffset: CGFloat = puzzleContainerHeigth - puzzleBoardSize - (3 * padding)
            puzzleBoard.frame = CGRect(x: puzzleBoardXOffset, y: puzzleBoardYOffset, width: puzzleBoardSize, height: puzzleBoardSize)
            print("puzzleboard width:\(puzzleBoard.frame.width) and height:\(puzzleBoard.frame.height)")
            
            let cornerRadii = padding * 2 // Radius of sliding parts edges
            let maskPath = UIBezierPath(roundedRect: puzzleBoardContainer.bounds,
                                        byRoundingCorners: [.bottomLeft],
                                        cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            puzzleBoardContainer.layer.mask = shape
            puzzleBoardContainer.layer.masksToBounds = true

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
                    self.backgroundView.alpha = 1
                    self.puzzleBoardContainer.center.x -= self.puzzleBoardContainer.bounds.width
                    self.puzzleBoard.center.x -= self.puzzleBoardContainer.bounds.width
                    self.timerView.center.x += self.timerView.bounds.width

            },
                completion: nil)
        }
    }
    
    @objc func dismissPuzzleBoard() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.backgroundView.alpha = 0
                self.puzzleBoardContainer.center.x += self.puzzleBoardContainer.bounds.width
                self.puzzleBoard.center.x += self.puzzleBoardContainer.bounds.width
                self.timerView.center.x -= self.timerView.bounds.width
        },
            completion: nil)
    }
    
    override init() {
        super.init()
    }
    
}


// MARK: PuzzelBoard Delegates
extension PuzzleBoardLauncher: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    // Number of items in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding = puzzleBoard.frame.width
        let cellSize = puzzleBoard.frame.width / 5
//        print(cellSize)
        return CGSize(width: cellSize, height: cellSize)
    }

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell
        return cell
    }

}




 
