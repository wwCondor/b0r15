//
//  AddImageVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class AddImageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: SFSymbols.backIcon, style: .done, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
