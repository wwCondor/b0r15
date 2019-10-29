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
        imageView.backgroundColor = UIColor.systemOrange
        return imageView
    }()
    
    override func setupViews() {
        addSubview(imageView)
        
        addConstraintsWithFormat("H:|[v0]|", views: imageView)
        addConstraintsWithFormat("V:|[v0]|", views: imageView)
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
