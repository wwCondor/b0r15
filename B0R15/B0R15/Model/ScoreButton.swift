//
//  ScoreButton.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ScoreButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        addStyle()
    }
    
    private func addStyle() {
        backgroundColor = UIColor(named: Color.scoreButton.rawValue)
        translatesAutoresizingMaskIntoConstraints = false
        frame = CGRect(x: 0, y: 0, width: Constants.scoreButtonSize, height: Constants.scoreButtonSize)
        layer.cornerRadius = Constants.scoreButtonCornerRadius
        layer.masksToBounds = true
    }
    
}

