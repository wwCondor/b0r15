//
//  SelectionButton.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit


struct ButtonConstants {
    static let buttonSize: CGFloat = 120
    static let buttonCornerRadius = buttonSize / 2
}

class SelectionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
//        addShadow()
        addPulse()
        addStyle()
    }
    
    private func addStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = ButtonConstants.buttonCornerRadius
        layer.masksToBounds = true
    }
    
    // Needs work
//    private func addShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 6)
//        layer.shadowRadius = 1
//        layer.shadowOpacity = 0.5
//        layer.cornerRadius = Constants.buttonSize / 2
//        clipsToBounds = true
//        layer.masksToBounds = true
//    }
    
    private func addPulse() {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 1.4 // Specifies the basic duration of the animation, in seconds.
        pulse.fromValue = 0.88 // Defines the value the receiver uses to start interpolation.
        pulse.toValue = 1.12 // Defines the value the receiver uses to end interpolation.
        pulse.autoreverses = true // Determines if the receiver plays in the reverse upon completion.
        pulse.repeatCount = .infinity // Determines the number of times the animation will repeat.
        layer.add(pulse, forKey: "pulsing")
    }
}




