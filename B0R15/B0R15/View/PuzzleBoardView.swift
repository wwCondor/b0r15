//
//  PuzzleBoardView.swift
//  B0R15
//
//  Created by Wouter Willebrands on 08/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

//
class PuzzleBoardView: CustomView {
    
//    lazy var puzzleBoard: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeUpGesture.direction = .up
//        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeRightGesture.direction = .right
//        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeDownGesture.direction = .down
//        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeLeftGesture.direction = .left
//        puzzleBoard.addGestureRecognizer(swipeUpGesture)
//        puzzleBoard.addGestureRecognizer(swipeRightGesture)
//        puzzleBoard.addGestureRecognizer(swipeDownGesture)
//        puzzleBoard.addGestureRecognizer(swipeLeftGesture)
//        puzzleBoard.backgroundColor = UIColor(named: Colors.puzzleBoard.name)
//        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
//        puzzleBoard.dataSource = self
//        puzzleBoard.delegate = self
//        return puzzleBoard
//    }()
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
}

extension PuzzleBoardView {
    
}



class CustomView: UIView {
    
    //init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    //init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }
    
    func setupView() {

    }
    
    func setupConstraints() {

    }
}
