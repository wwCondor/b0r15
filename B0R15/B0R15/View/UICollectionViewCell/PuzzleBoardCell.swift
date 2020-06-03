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
        
        let cellPadding: CGFloat = 2

        imageView.pinToEdges(of: self, with: cellPadding)
        
    }
}
