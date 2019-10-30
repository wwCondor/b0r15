//
//  ScoreboardCell.swift
//  B0R15
//
//  Created by Wouter Willebrands on 29/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreboardCell: BaseCell {

    // This should become UILabel/UITextView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemOrange
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        
        let cellPadding: CGFloat = Constants.scoreboardCellPadding
        
        addConstraintsWithFormat("H:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
        addConstraintsWithFormat("V:|-\(cellPadding)-[v0]-\(cellPadding)-|", views: imageView)
    }
}
