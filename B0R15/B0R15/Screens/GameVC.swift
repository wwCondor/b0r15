//
//  GameVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    private let menuButton               = BButton(image: SFSymbols.menuIcon!)
    private let puzzleBoardContainerView = PuzzleBoardContainerView()
    private let selectImageButton        = BTextButton(title: "Select Image")
    private let startGameButton          = BTextButton(title: "Start Game")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        configureView()
        
        addTargets()
    }
    
    private func configureView() {
        view.addSubviews(menuButton, puzzleBoardContainerView, selectImageButton, startGameButton)
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            menuButton.heightAnchor.constraint(equalToConstant: 50),
            menuButton.widthAnchor.constraint(equalToConstant: 50),
            
            puzzleBoardContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            puzzleBoardContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            puzzleBoardContainerView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
            puzzleBoardContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startGameButton.heightAnchor.constraint(equalToConstant: 50),
            
            selectImageButton.bottomAnchor.constraint(equalTo: startGameButton.topAnchor, constant: -20),
            selectImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            selectImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            selectImageButton.heightAnchor.constraint(equalToConstant: 50),
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
        presentImageSelectionVC()
    }
    
    private func presentImageSelectionVC() {
        let imageSelectionVC = ImageSelectionVC()
        imageSelectionVC.delegate = puzzleBoardContainerView
        imageSelectionVC.title = "Select Image"
        let navigationController = UINavigationController(rootViewController: imageSelectionVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
