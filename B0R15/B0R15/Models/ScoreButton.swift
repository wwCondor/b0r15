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
//        addShadow()
//        addPulse()
        addStyle()
    }
    
    private func addStyle() {
        backgroundColor = UIColor(named: Color.scoreButton.rawValue)
        translatesAutoresizingMaskIntoConstraints = false
        frame = CGRect(x: 0, y: 0, width: ButtonConstants.scoreButtonSize, height: ButtonConstants.scoreButtonSize)
        layer.cornerRadius = ButtonConstants.scoreButtonCornerRadisu
        layer.masksToBounds = true
    }
    
    // Needs work
//    private func addShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 6)
//        layer.shadowRadius = 1
//        layer.shadowOpacity = 0.5
//        clipsToBounds = true
//        layer.masksToBounds = true
//    }
    

}

