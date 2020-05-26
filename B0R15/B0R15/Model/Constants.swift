//
//  Constants.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

struct Constants {
    // button sizes
    static let scoreButtonSize: CGFloat = 30
    static let buttonSize: CGFloat = 120

    // corner radii
    static let scoreButtonCornerRadius = scoreButtonSize / 2
    static let buttonCornerRadius = buttonSize / 2
    static let scoreboardCornerRadius: CGFloat = 30
    static let sliderCornerRadius: CGFloat = 60 // sliders: timerView and puzzleBoardView
    static let puzzleTileCornerRadius: CGFloat = 10
    
    // padding
    static let puzzleBoardCellPadding: CGFloat = 2
    static let scoreboardCellPadding: CGFloat = 4
    
    // puzzleBoard cells
    static let numberOfSections: Int = 4
    static let numberOfItemInSection: Int = 4
    
    static let dismissNotificationKey = "dismiss"
//    static let resetTimerNotificationKey = "resetTimer"
//    static let pauseTimerNotificationKey = "pauseTimer"

    
}



