//
//  PuzzleBoardContainerView.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardContainerView: UIView {
        
    var gameSequence: [UIImage]     = []
    var solutionSequence: [UIImage] = []
    
    lazy var puzzleBoardCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoardCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        puzzleBoardCV.translatesAutoresizingMaskIntoConstraints = false
        puzzleBoardCV.backgroundColor = .systemPink
        puzzleBoardCV.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: PuzzleBoardCell.identifier)
        puzzleBoardCV.delegate = self
        puzzleBoardCV.dataSource = self
        return puzzleBoardCV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addGestureRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(puzzleBoardCV)
        puzzleBoardCV.pinToEdges(of: self, padding: 0)
    }
    
    private func addGestureRecognizers() {
        let swipeUpGesture      = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        let swipeRightGesture   = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        let swipeDownGesture    = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        let swipeLeftGesture    = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        swipeUpGesture.direction    = .up
        swipeRightGesture.direction = .right
        swipeDownGesture.direction  = .down
        swipeLeftGesture.direction  = .left
        puzzleBoardCV.addGestureRecognizer(swipeUpGesture)
        puzzleBoardCV.addGestureRecognizer(swipeRightGesture)
        puzzleBoardCV.addGestureRecognizer(swipeDownGesture)
        puzzleBoardCV.addGestureRecognizer(swipeLeftGesture)
    }
    
    @objc func swipeDetected(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            let topEdge =    [ 0,  1,  2,  3]
            let rightEdge =  [ 3,  7, 11, 15]
            let bottomEdge = [12, 13, 14, 15]
            let leftEdge =   [ 0,  4,  8, 12]
            
            // Check index of transparant square
            guard let index = gameSequence.firstIndex(of: VoidImage.clear) else { return }
            
            switch sender.direction {
            case .up:
                guard bottomEdge.contains(index) == false else { return }
                gameSequence = repositionEmptyTile(in: gameSequence, fromIndex: index, toIndex: index + 4)
            case .right:
                guard leftEdge.contains(index) == false else { return }
                gameSequence = repositionEmptyTile(in: gameSequence, fromIndex: index, toIndex: index - 1)
            case .down:
                guard topEdge.contains(index) == false else { return }
                    gameSequence = repositionEmptyTile(in: gameSequence, fromIndex: index, toIndex: index - 4)
            case .left:
                guard rightEdge.contains(index) == false else { return}
                gameSequence = repositionEmptyTile(in: gameSequence, fromIndex: index, toIndex: index + 1)
            default: print("This does not work")}
            
            updatePuzzleBoard()
            compareArrays()
        }
    }
        
    private func repositionEmptyTile<T>(in array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var newArray = array
        newArray.swapAt(fromIndex, toIndex)
        return newArray
    }
    
    
    /// Udates UI after image selection and swipe gesture
    func updatePuzzleBoard() {
        DispatchQueue.main.async { self.puzzleBoardCV.performBatchUpdates({ self.puzzleBoardCV.reloadItems(at: self.puzzleBoardCV.indexPathsForVisibleItems) }, completion: nil) }
    }
    
    /// Determines whether puzzle has been solved
    private func compareArrays() {
        if gameSequence == solutionSequence {
            // In here we should end game
            print("Arrays match!")
        } else {
            
        }
    }
}

extension PuzzleBoardContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = puzzleBoardCV.dequeueReusableCell(withReuseIdentifier: PuzzleBoardCell.identifier, for: indexPath) as! PuzzleBoardCell
        
        let index = indexPath.section * Constants.numberOfItemsInSection + indexPath.row
        
        if gameSequence.count != 0 {
            cell.imageView.image = gameSequence[index]
        } else {
            cell.imageView.backgroundColor = .clear
        }
        
        return cell
    }
    
}

extension PuzzleBoardContainerView: ImageSelectionDelegate {
    func imageSelected(image: UIImage) {
        solutionSequence = image.createSolutionSequence()
        gameSequence = solutionSequence.shuffled()
        updatePuzzleBoard()
    }
}
