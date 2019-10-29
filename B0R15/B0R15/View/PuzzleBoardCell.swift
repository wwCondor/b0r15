//
//  PuzzelBoardCell.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardCell: BaseCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: Color.puzzleTile.rawValue)
        imageView.layer.cornerRadius = Constants.puzzleTileCornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        addSubview(imageView)
        
        let cellPadding: CGFloat = Constants.puzzleBoardCellPadding
        
        addConstraintsWithFormat("H:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
        addConstraintsWithFormat("V:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
    }
}

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
