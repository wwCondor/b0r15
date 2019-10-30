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
    let puzzleBoardCellId = "cellId"
    
    var testImages = ["0", "0", "0", "0",
                      "0", "0", "0", "0",
                      "0", "0", "0", "1",
                      "0", "0", "0", "0"]
        
    lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.alpha = 0
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:))))
        return backgroundView
    }()

    lazy var puzzleBoardView: UIView = {
        let puzzleBoardView = UIView()
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:)))
        swipeRightGesture.direction = .right
        puzzleBoardView.addGestureRecognizer(swipeRightGesture)
        puzzleBoardView.backgroundColor = UIColor(named: Color.puzzleBoard.rawValue)
        puzzleBoardView.layer.masksToBounds = true
        return puzzleBoardView
    }()
    
    lazy var puzzleBoard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeUpGesture.direction = .up
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeRightGesture.direction = .right
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeDownGesture.direction = .down
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeLeftGesture.direction = .left
        puzzleBoard.addGestureRecognizer(swipeUpGesture)
        puzzleBoard.addGestureRecognizer(swipeRightGesture)
        puzzleBoard.addGestureRecognizer(swipeDownGesture)
        puzzleBoard.addGestureRecognizer(swipeLeftGesture)
        puzzleBoard.backgroundColor = UIColor(named: Color.puzzleBoard.rawValue)
        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
        puzzleBoard.dataSource = self
        puzzleBoard.delegate = self
        return puzzleBoard
    }()
    
    lazy var timerView: UIView = {
        let timerView = UIView()
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard))
        swipeLeftGesture.direction = .left
        timerView.addGestureRecognizer(swipeLeftGesture)
        timerView.backgroundColor = UIColor(named: Color.timerView.rawValue)
        timerView.layer.masksToBounds = true
        return timerView
    }()
    
        
    func showPuzzleBoard() {
        
        guard let modeSelected = modeSelected else {
            return
        }
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        if let window = window {
            
            if modeSelected == .modeOne {
                backgroundView.backgroundColor = UIColor.systemPurple
            } else if modeSelected == .modeTwo {
                backgroundView.backgroundColor = UIColor.systemTeal
            }
            
            window.addSubview(backgroundView)
            window.addSubview(puzzleBoardView)
            window.addSubview(puzzleBoard)
            window.addSubview(timerView)
                    
            backgroundView.frame = window.frame
            
            let screenWidth = window.frame.width
            let screenHeigth = window.frame.height
            let padding = screenWidth / 16

            let timerViewHeigth = screenHeigth * (1/4)
            let timerViewXOffset: CGFloat = -screenWidth
            let timerViewYOffset: CGFloat = screenHeigth * (3/4)
            timerView.frame = CGRect(x: timerViewXOffset, y: timerViewYOffset, width: screenWidth, height: timerViewHeigth)
            
            let puzzleViewHeigth = screenHeigth * (3/4) - padding
            let puzzleViewXOffset: CGFloat = screenWidth
            let puzzleViewYOffset: CGFloat = 0
            puzzleBoardView.frame = CGRect(x: puzzleViewXOffset, y: puzzleViewYOffset, width: screenWidth, height: puzzleViewHeigth)

            let puzzleBoardSize = screenWidth - 2 * padding
            let puzzleBoardXOffset: CGFloat = screenWidth + padding
            let puzzleBoardYOffset: CGFloat = puzzleViewHeigth - puzzleBoardSize - (2 * padding)
            puzzleBoard.frame = CGRect(x: puzzleBoardXOffset, y: puzzleBoardYOffset, width: puzzleBoardSize, height: puzzleBoardSize)
            
            let maskPath = UIBezierPath(roundedRect: puzzleBoardView.bounds,
                                        byRoundingCorners: [.bottomLeft],
                                        cornerRadii: CGSize(width: Constants.sliderCornerRadius, height: Constants.sliderCornerRadius))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            puzzleBoardView.layer.mask = shape

            let timerMaskPath = UIBezierPath(roundedRect: timerView.bounds,
                                             byRoundingCorners: [.topRight],
                                             cornerRadii: CGSize(width: Constants.sliderCornerRadius, height: Constants.sliderCornerRadius))
            let timerShape = CAShapeLayer()
            timerShape.path = timerMaskPath.cgPath
            timerView.layer.mask = timerShape
            
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.backgroundView.alpha = 1
                    self.puzzleBoardView.center.x -= self.puzzleBoardView.bounds.width
                    self.puzzleBoard.center.x -= self.puzzleBoardView.bounds.width
                    self.timerView.center.x += self.timerView.bounds.width

            },
                completion: nil)
        }
    }
    
    @objc func dismissPuzzleBoard(sender: UISwipeGestureRecognizer) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.backgroundView.alpha = 0
                self.puzzleBoardView.center.x += self.puzzleBoardView.bounds.width
                self.puzzleBoard.center.x += self.puzzleBoardView.bounds.width
                self.timerView.center.x -= self.timerView.bounds.width
        },
            completion: nil)
    }
    
    override init() {
        super.init()
    }
    
}

// MARK: CollectionView Delegates
extension PuzzleBoardLauncher: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    // Number of items in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItemInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = puzzleBoard.frame.width / 4
        return CGSize(width: cellSize, height: cellSize)
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell
        
        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
        cell.imageView.image = UIImage(named: testImages[index])
        
        return cell
    }
    
    // Sets up what to do when a cell gets tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

}




 
