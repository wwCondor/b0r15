//
//  PuzzleBoardCollectionVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit


class PuzzleBoardCollectionVC: UICollectionViewController {
    
    private let puzzleBoardCellId = "cellId"
    
//    private let imageArrayProvider = GameArrayProvider()
    
    var gameSequence: [UIImage] = []
    var solutionSequence: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItemInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = view.frame.width / 4
        return CGSize(width: cellSize, height: cellSize)
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell
        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
        
        cell.imageView.image = gameSequence[index]
    
        return cell
    }

}
