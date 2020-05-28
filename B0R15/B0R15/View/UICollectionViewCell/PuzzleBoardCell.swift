//
//  PuzzelBoardCell.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardCell: BCollectionViewCell {
    
    static let identifier = "puzzleBoardId" 
    
//    private let imageView = UIImageView()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.puzzleTileCornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        
        imageView.backgroundColor = .systemYellow
        
        let cellPadding: CGFloat = Constants.puzzleBoardCellPadding
        
        addConstraintsWithFormat("H:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
        addConstraintsWithFormat("V:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
    }
}
