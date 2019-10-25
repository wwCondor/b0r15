//
//  MainController.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemYellow
        
        setupViews()
    }
    
    lazy var puzzleField: PuzzleField = {
        let puzzleField = PuzzleField()
        
        return puzzleField
    }()
    
    lazy var timeLabel: GameTimer = {
        let timeLabel = GameTimer()
        return timeLabel
    }()
    
    
    func setupViews() {
//        view.addSubview(puzzleField)
    }
    
    
}

class PuzzleField: UICollectionView {
    
}

class GameTimer: UILabel {
    
    
}
