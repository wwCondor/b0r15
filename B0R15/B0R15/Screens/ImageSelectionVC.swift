//
//  ImageSelectionVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class ImageSelectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink

        configureNavigationBar()

    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: SFSymbols.back, style: .done, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
//    private func addTargets() {
//
//    }
//    
//    @objc private func menuButtonTapped() {
//        print("tapped")
//    }


}
