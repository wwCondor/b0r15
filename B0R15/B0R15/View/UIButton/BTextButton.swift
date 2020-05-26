//
//  BTextButton.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class BTextButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds   = false
        layer.borderWidth     = 2
        layer.borderColor     = UIColor.white.cgColor
        layer.cornerRadius    = 10
        backgroundColor       = .systemPink
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) //alows for dynaminc type
        setTitleColor(.white, for: .normal)
    }
}
