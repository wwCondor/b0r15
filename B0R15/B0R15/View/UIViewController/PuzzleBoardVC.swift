//
//  PuzzleBoardVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardVC: UIViewController {
    
    let puzzleBoardCellId = "cellId"
    
    var gameSequence: [UIImage]     = []
    var solutionSequence: [UIImage] = []
    
    lazy var puzzleBoardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoardCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        puzzleBoardCV.translatesAutoresizingMaskIntoConstraints = false
        puzzleBoardCV.backgroundColor = .systemPink
        puzzleBoardCV.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
        puzzleBoardCV.delegate = self
        puzzleBoardCV.dataSource = self
        return puzzleBoardCV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
                
        configureView()
        
        addTargets()
    }
    
    private func configureView() {
        view.addSubviews(puzzleBoardCollectionView)

        NSLayoutConstraint.activate([
            puzzleBoardCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            puzzleBoardCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            puzzleBoardCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            puzzleBoardCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func addTargets() {

    }

}

extension PuzzleBoardVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

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
        let cellSize = puzzleBoardCollectionView.frame.width / 4
        return CGSize(width: cellSize, height: cellSize)
    }

    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = puzzleBoardCollectionView.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell

//        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row

        //        let voidImage: UIImage = #imageLiteral(resourceName: "1")
        //
        //        if index == 1 {
        //            cell.imageView.image = voidImage
        //        } else {
        //            cell.imageView.image = gameSequence[index]
        //        }

//        cell.imageView.image = gameSequence[index]

        return cell
    }

    // Sets up what to do when a cell gets tapped (maybe add some hidden animation?)
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath)
//    }

}
