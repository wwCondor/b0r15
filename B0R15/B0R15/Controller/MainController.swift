//
//  SplashController.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class MainController: UIViewController {
        
    let puzzleBoardManager = PuzzleBoardManager()
    let timerManager = TimerManager()
    let scoreboardManager = ScoreboardManager()
    let gameArrayProvider = GameArrayProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    lazy var modeOneButton: SelectionButton = {
        let modeOneButton = SelectionButton()
        modeOneButton.backgroundColor = UIColor(named: Colors.modeOneButton.name)
        modeOneButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeOneButton
    }()
    
    lazy var modeTwoButton: SelectionButton = {
        let modeTwoButton = SelectionButton()
        modeTwoButton.backgroundColor = UIColor(named: Colors.modeTwoButton.name)
        modeTwoButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeTwoButton
    }()
    
    lazy var scoreButton: ScoreButton = {
        let scoreButton = ScoreButton()
        scoreButton.addTarget(self, action: #selector(showScoreboard), for: .touchUpInside)
        return scoreButton
    }()
    
    private func setupView() {
        view.backgroundColor = UIColor(named: Colors.backgroundColor.name)
        view.addSubview(modeOneButton)
        view.addSubview(modeTwoButton)
        view.addSubview(scoreButton)
        setupLayout()
    }
    
    private func setupLayout() {
        modeOneButton.translatesAutoresizingMaskIntoConstraints = false
        modeOneButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        modeOneButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        modeOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        modeOneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(2 * Constants.buttonSize)).isActive = true
        
        modeTwoButton.translatesAutoresizingMaskIntoConstraints = false
        modeTwoButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        modeTwoButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        modeTwoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        modeTwoButton.centerYAnchor.constraint(equalTo: modeOneButton.centerYAnchor, constant: 2 * Constants.buttonSize).isActive = true
        
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        scoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(1.5 * Constants.scoreButtonSize)).isActive = true
        scoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(1.5 * Constants.scoreButtonSize)).isActive = true
    }
    
    @objc private func showScoreboard(sender: ScoreButton) {
        scoreboardManager.presentScoreboard()
    }
    
    @objc private func startGame(sender: SelectionButton) {
        gameArrayProvider.createGameArrays()
        
        let gameArray = gameArrayProvider.gameSequence
        let solutionArray = gameArrayProvider.solutionSequence
        
        if gameArray.isEmpty || solutionArray.isEmpty == false {
            switch sender {
            case modeOneButton:
                print("Mode 1 selected")
                puzzleBoardManager.gameSequence = gameArray
                puzzleBoardManager.solutionSequence = solutionArray
                puzzleBoardManager.modeSelected = .modeOne
            case modeTwoButton:
                print("Mode 2 selected")
                puzzleBoardManager.gameSequence = gameArray
                puzzleBoardManager.solutionSequence = solutionArray
                puzzleBoardManager.modeSelected = .modeTwo
            default: print("This does not work")
            }
            puzzleBoardManager.showPuzzleBoard()
            timerManager.showTimer()
            timerManager.startTimer()
        } else {
            print("Unable to transfer arrays into puzzleBoardManager")
        }
    }
    
}







