//
//  ImageSelectionVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

/// The delegate that will inform the GameVC that an image has been selected.
protocol ImageSelectionDelegate: class {
    func imageSelected()
}

class ImageSelectionVC: UIViewController {
    
    let puzzleImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink

        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: SFSymbols.backIcon, style: .done, target: self, action: #selector(backButtonTapped))
        let addImageButton = UIBarButtonItem(image: SFSymbols.addIcon, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = addImageButton
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func addButtonTapped() {
        let addIageVC = AddImageVC()
        addIageVC.title = "Photo Library"
        let navigationController = UINavigationController(rootViewController: addIageVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

}
