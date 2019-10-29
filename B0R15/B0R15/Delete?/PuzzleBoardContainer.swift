////
////  PuzzleView.swift
////  B0R15
////
////  Created by Wouter Willebrands on 28/10/2019.
////  Copyright © 2019 Studio Willebrands. All rights reserved.
////
//
//import UIKit
//
//class PuzzleBoardContainer: UIView {
//        
//    let cellId = "cellId"
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        print(frame.width) // this is nil...
//        setupView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupView()
//    }
//    
//    lazy var puzzleBoard: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        puzzleBoard.backgroundColor = UIColor.systemPink
//        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: cellId)
//        let xOffset: CGFloat = 20
//        let yOffset: CGFloat = 230
//        let puzzelBoardSize: CGFloat = 370
//        puzzleBoard.frame = CGRect(x: xOffset, y: yOffset, width: puzzelBoardSize, height: puzzelBoardSize) // Get these to have absolute values
//        puzzleBoard.dataSource = self
//        puzzleBoard.delegate = self
//        return puzzleBoard
//    }()
//    
//    private func setupView() {
//    
//        setupLayout()
//        addSubview(puzzleBoard)
//        
//
////        if let window = self.window {
////            let screenWidth = window.frame.width
////            let screenHeight = window.frame.height
////            let padding = screenWidth / 16
////            let puzzleBoardSize = screenWidth - (2 * padding)
////
////            let puzzleXOffset = padding
////            let puzzleYOffset = (screenHeight * (2/4)) - (puzzleBoardSize + padding)
////
////            addSubview(puzzleBoard)
////
////            puzzleBoard.frame = CGRect(x: puzzleXOffset, y: puzzleYOffset, width: puzzleBoardSize, height: puzzleBoardSize)
////        }
//    }
//    
//    private func setupLayout() {
//        translatesAutoresizingMaskIntoConstraints = false
//
////        NSLayoutConstraint.activate([
////            puzzleBoard.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
////            puzzleBoard.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
////        ])
//    }
//    
//}
//
//// MARK: PuzzelBoard Delegates
//extension PuzzleBoardContainer: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    // Number of sections
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 4
//    }
//    
//    // Number of items in sections
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    // Size of cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let padding = puzzleBoard.frame.width
//        let cellSize = puzzleBoard.frame.width / 5
////        print(cellSize)
//        return CGSize(width: cellSize, height: cellSize)
//    }
//
//    // Content of cell
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PuzzleBoardCell
//        return cell
//    }
//
//}
