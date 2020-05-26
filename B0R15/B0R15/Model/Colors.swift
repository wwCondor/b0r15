//
//  Colors.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

enum Colors {
    case backgroundColor
    case modeOneButton
    case modeTwoButton
    case scoreButton
    case puzzleBoard
    case puzzleTile
    case timerView
    case timeLabelText
    case scoreBoardBG
    
    var name: String {
        switch self {
        case .backgroundColor: return "BackgroundColor"
        case .modeOneButton: return "ModeOneButton"
        case .modeTwoButton: return "ModeTwoButton"
        case .scoreButton: return "ScoreButton"
        case .puzzleBoard: return "PuzzleBoard"
        case .puzzleTile: return "PuzzleTile"
        case .timerView: return "TimerView"
        case .timeLabelText: return "TimeLabelText"
        case .scoreBoardBG: return "ScoreBoardBG"
        }
    }
}
