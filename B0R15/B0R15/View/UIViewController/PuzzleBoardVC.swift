//
//  PuzzleBoardVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardVC: UIViewController {
    
    private let menuButton        = BButton(image: SFSymbols.dotMenu!)
    private let selectImageButton = BTextButton(title: "Select Image")
    private let startGameButton   = BTextButton(title: "Start Game")
//    private let buttonShadow = BShadowView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
                
        configureView()
        addTargets()
    }
    
    private func configureView() {
        view.addSubviews(menuButton, selectImageButton, startGameButton)
        
//        menuButton.addSubview(buttonShadow)
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            menuButton.heightAnchor.constraint(equalToConstant: 50),
            menuButton.widthAnchor.constraint(equalToConstant: 50),
            
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startGameButton.heightAnchor.constraint(equalToConstant: 50),
            
            selectImageButton.bottomAnchor.constraint(equalTo: startGameButton.topAnchor, constant: -20),
            selectImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            selectImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            selectImageButton.heightAnchor.constraint(equalToConstant: 50),
            
//            buttonShadow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            buttonShadow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            buttonShadow.heightAnchor.constraint(equalToConstant: 50),
//            buttonShadow.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addTargets() {
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        selectImageButton.addTarget(self, action: #selector(selectImageButtonTapped), for: .touchUpInside)
    }
    
    @objc private func menuButtonTapped() {
        print("Menu Button Tapped")
    }
    
    @objc private func startGameButtonTapped() {
        print("Start Game Button Tapped")
    }
    
    @objc private func selectImageButtonTapped() {
        print("Select Image Button Tapped")
    }
}
