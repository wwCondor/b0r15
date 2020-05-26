//
//  BShadowView.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class BShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize.zero
        layer.shadowOpacity = 0.5
        layer.shadowRadius  = 5
    }
    
}
