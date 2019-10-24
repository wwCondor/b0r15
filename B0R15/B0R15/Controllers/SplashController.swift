//
//  SplashController.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    lazy var blueSelectionButton: SelectionButton = {
        let blueSelectionButton = SelectionButton()
        blueSelectionButton.backgroundColor = UIColor.blue
        blueSelectionButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return blueSelectionButton
    }()
    
    lazy var redSelectionButton: SelectionButton = {
        let redSelectionButton = SelectionButton()
        redSelectionButton.backgroundColor = UIColor.red
        redSelectionButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return redSelectionButton
    }()

    
    func setupViews() {
        
        view.backgroundColor = UIColor.systemYellow
        view.addSubview(blueSelectionButton)
        view.addSubview(redSelectionButton)
        
        blueSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        blueSelectionButton.heightAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true // Height of the menuBar
        blueSelectionButton.widthAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true
        blueSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        blueSelectionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -ButtonConstants.buttonSize).isActive = true
        
        redSelectionButton.translatesAutoresizingMaskIntoConstraints = false
        redSelectionButton.heightAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true // Height of the menuBar
        redSelectionButton.widthAnchor.constraint(equalToConstant: ButtonConstants.buttonSize).isActive = true
        redSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        redSelectionButton.centerYAnchor.constraint(equalTo: blueSelectionButton.centerYAnchor, constant: 2 * ButtonConstants.buttonSize).isActive = true
         
    }
    
    @objc func startGame(sender: UIButton!) {
        switch sender {
        case blueSelectionButton: print("Blue mode selected") // We transition to mainController in blue mode
        case redSelectionButton: print("Red mode selected") //  We transition to mainController in red mode
        default: print("This does not work")
        }
    }

}







