//
//  SplashController.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    
    let puzzleBoardLauncher = PuzzleBoardLauncher()
    let scoreboardLauncher = ScoreboardLauncher()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    lazy var modeOneSelectionButton: SelectionButton = {
        let modeOneSelectionButton = SelectionButton()
        modeOneSelectionButton.backgroundColor = UIColor(named: Color.modeOne.rawValue)
        modeOneSelectionButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeOneSelectionButton
    }()
    
    lazy var modeTwoSelectionButton: SelectionButton = {
        let modeTwoSelectionButton = SelectionButton()
        modeTwoSelectionButton.backgroundColor = UIColor(named: Color.modeTwo.rawValue)
        modeTwoSelectionButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeTwoSelectionButton
    }()
    
    lazy var scoreButton: ScoreButton = {
        let scoreButton = ScoreButton()
        scoreButton.addTarget(self, action: #selector(showScores), for: .touchUpInside)
        return scoreButton
    }()
    
    func setupViews() {
        view.backgroundColor = UIColor(named: Color.backgroundColor.rawValue)
        view.addSubview(modeOneSelectionButton)
        view.addSubview(modeTwoSelectionButton)
        view.addSubview(scoreButton)
        
        modeOneSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        modeOneSelectionButton.heightAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true // Height of the menuBar
        modeOneSelectionButton.widthAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true
        modeOneSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        modeOneSelectionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(2 * ButtonConstants.buttonSize)).isActive = true
        
        modeTwoSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        modeTwoSelectionButton.heightAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true // Height of the menuBar
        modeTwoSelectionButton.widthAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true
        modeTwoSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        modeTwoSelectionButton.centerYAnchor.constraint(equalTo: modeOneSelectionButton.centerYAnchor, constant: 2 * ButtonConstants.buttonSize).isActive = true
        
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        scoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(1.5 * ButtonConstants.scoreButtonSize)).isActive = true
        scoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(1.5 * ButtonConstants.scoreButtonSize)).isActive = true
        
    }
    
    @objc func showScores(sender: ScoreButton) {
        scoreboardLauncher.showScores()
    }
    
    
    @objc func startGame(sender: SelectionButton) {
        switch sender {
        case modeOneSelectionButton:
            print("Mode 1 selected")
            puzzleBoardLauncher.modeSelected = .modeOne
            puzzleBoardLauncher.showPuzzelBoard()
        case modeTwoSelectionButton:
            print("Mode 2 selected")
            puzzleBoardLauncher.modeSelected = .modeTwo
            puzzleBoardLauncher.showPuzzelBoard()
        default: print("This does not work")
        }
    }
    

}







