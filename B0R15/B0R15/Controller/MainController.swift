//
//  SplashController.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
//    func createGameArray(completion: @escaping ([UIImage]?, Error?) -> Void) {
//        var dividedImage = imageDivider()
//        let voidImage: UIImage = #imageLiteral(resourceName: "1")
//
//        dividedImage.remove(at: dividedImage.count - 1)
//        dividedImage.append(voidImage)
//
//        solutionTileSequence = dividedImage
//        print(dividedImage)
//    }
    
    let puzzleBoardLauncher = PuzzleBoardLauncher()
    let scoreboardLauncher = ScoreboardLauncher()
    
//    let tileManager = TileManager()
    
//    let tileManager = TileManager.init()
    
//    lazy var solutionSequence: [UIImage] = tileManager.solutionTileSequence
//    lazy var testImages: [UIImage] = tileManager.gameTileSequence

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        createGameArrays()
//        tileManager.createGameArrays()
    }
    
//    func createGameArrays() {
//        var dividedImage = tileManager.imageDivider()
//        let voidImage: UIImage = #imageLiteral(resourceName: "1")
//
//        dividedImage.remove(at: dividedImage.count - 1)
//        dividedImage.append(voidImage)
//
//        puzzleBoardLauncher.solutionSequence = dividedImage
//        puzzleBoardLauncher.testImages = dividedImage.shuffled()
//    }
    
    lazy var modeOneButton: SelectionButton = {
        let modeOneButton = SelectionButton()
        modeOneButton.backgroundColor = UIColor(named: Color.modeOneButton.rawValue)
        modeOneButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeOneButton
    }()
    
    lazy var modeTwoButton: SelectionButton = {
        let modeTwoButton = SelectionButton()
        modeTwoButton.backgroundColor = UIColor(named: Color.modeTwoButton.rawValue)
        modeTwoButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return modeTwoButton
    }()
    
    lazy var scoreButton: ScoreButton = {
        let scoreButton = ScoreButton()
        scoreButton.addTarget(self, action: #selector(showScoreboard), for: .touchUpInside)
        return scoreButton
    }()
    
    private func setupView() {
        view.backgroundColor = UIColor(named: Color.backgroundColor.rawValue)
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
        scoreboardLauncher.presentScoreboard()
    }
    
    @objc private func startGame(sender: SelectionButton) {
        switch sender {
        case modeOneButton:
            print("Mode 1 selected")
            puzzleBoardLauncher.modeSelected = .modeOne
        case modeTwoButton:
            print("Mode 2 selected")
            puzzleBoardLauncher.modeSelected = .modeTwo
        default: print("This does not work")
        }
        setupGame()
    }
    
    private func setupGame() {
        puzzleBoardLauncher.showPuzzleBoard()
        puzzleBoardLauncher.startTimer()
        puzzleBoardLauncher.createGameArrays()
    }
    
}







