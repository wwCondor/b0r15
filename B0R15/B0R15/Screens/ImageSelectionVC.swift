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

        configureNavigationBar()

    }
    
    private func configureNavigationBar() {
        let menuButton = UIButton(type: UIButton.ButtonType.custom)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        let menuImage  = SFSymbols.dotMenu
        //        menuButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        menuButton.setImage(menuImage, for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let navBarButton = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = navBarButton
    }
    
    private func addTargets() {
        
    }
    
    @objc private func menuButtonTapped() {
        print("tapped")
    }


}
