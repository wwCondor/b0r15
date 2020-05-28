////
////  PuzzleBoardView.swift
////  B0R15
////
////  Created by Wouter Willebrands on 08/11/2019.
////  Copyright © 2019 Studio Willebrands. All rights reserved.
////
//
//import UIKit
//
//
//class PuzzleBoard: CustomView {
//    
//    let puzzleBoardCellId = "cellId"
//    
//    var gameSequence: [UIImage] = []
//    var solutionSequence: [UIImage] = []
//    
//    lazy var puzzleBoard: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
////        swipeUpGesture.direction = .up
////        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
////        swipeRightGesture.direction = .right
////        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
////        swipeDownGesture.direction = .down
////        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
////        swipeLeftGesture.direction = .left
////        puzzleBoard.addGestureRecognizer(swipeUpGesture)
////        puzzleBoard.addGestureRecognizer(swipeRightGesture)
////        puzzleBoard.addGestureRecognizer(swipeDownGesture)
////        puzzleBoard.addGestureRecognizer(swipeLeftGesture)
//        puzzleBoard.backgroundColor = UIColor(named: Colors.puzzleBoard.name)
//        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
//        puzzleBoard.dataSource = self
//        puzzleBoard.delegate = self
//        return puzzleBoard
//    }()
//    
//    override func setupView() {
//        super.setupView()
//    }
//    
//    override func setupConstraints() {
//        super.setupConstraints()
//    }
//    
//}
//
//extension PuzzleBoard: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    // Number of sections
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return Constants.numberOfSections
//    }
//    
//    // Number of items in sections
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Constants.numberOfItemInSection
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    // Size of cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellSize = puzzleBoard.frame.width / 4
//        return CGSize(width: cellSize, height: cellSize)
//    }
//    
//    // Space between cells
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    // Content of cell
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell
//        
//        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
//        
//        //        let voidImage: UIImage = #imageLiteral(resourceName: "1")
//        //
//        //        if index == 1 {
//        //            cell.imageView.image = voidImage
//        //        } else {
//        //            cell.imageView.image = gameSequence[index]
//        //        }
//        
//        cell.imageView.image = gameSequence[index]
//        
//        return cell
//    }
//    
//    // Sets up what to do when a cell gets tapped (maybe add some hidden animation?)
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        print(indexPath)
////    }
//    
//}
//
//
//
//
