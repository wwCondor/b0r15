//
//  PuzzleBoardContainerView.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardContainerView: UIView {
    
    lazy var puzzleBoardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoardCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        puzzleBoardCV.translatesAutoresizingMaskIntoConstraints = false
        puzzleBoardCV.backgroundColor = .systemPink
        puzzleBoardCV.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: PuzzleBoardCell.identifier)
//        puzzleBoardCV.delegate = self
//        puzzleBoardCV.dataSource = self
        return puzzleBoardCV
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

}

//extension PuzzleBoardContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
//
//
//
//}
