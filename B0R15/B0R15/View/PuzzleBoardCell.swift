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
        imageView.image = UIImage(named: "FloppyIcon")
        imageView.layer.cornerRadius = Constants.puzzleTileCornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        
        imageView.backgroundColor = UIColor(named: Color.puzzleTile.rawValue)

        let cellPadding: CGFloat = Constants.puzzleBoardCellPadding
        
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
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
