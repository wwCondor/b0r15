//
//  ScoreboardCell.swift
//  B0R15
//
//  Created by Wouter Willebrands on 29/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreboardCell: BCollectionViewCell {

    // This should become UILabel/UITextView
    let highScoreLabel: UILabel = {
        let highScoreLabel = UILabel()
        highScoreLabel.backgroundColor = UIColor.clear
        highScoreLabel.textColor = UIColor.white
        highScoreLabel.textAlignment = .center
        highScoreLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        highScoreLabel.text = "00.00.00"
        return highScoreLabel
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(highScoreLabel)
        
//        let cellPadding: CGFloat = Constants.scoreboardCellPadding
        
        highScoreLabel.pinToEdges(of: self)
    }
}
