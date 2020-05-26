//
//  BButton.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

import UIKit

class BButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
//        addPulse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage) {
        self.init()
        let rotatedImage = image.rotate(radians: .pi/2).withRenderingMode(.alwaysTemplate)
        tintColor        = .white
        setImage(rotatedImage, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds   = false
        layer.borderWidth     = 2
        layer.borderColor     = UIColor.white.cgColor
        layer.cornerRadius    = 25
        backgroundColor       = .systemPink
    }
    
//    private func addPulse() {
//        let pulse           = CABasicAnimation(keyPath: "transform.scale")
//        pulse.duration      = 1.4 // Specifies the basic duration of the animation, in seconds.
//        pulse.fromValue     = 0.88 // Defines the value the receiver uses to start interpolation.
//        pulse.toValue       = 1.12 // Defines the value the receiver uses to end interpolation.
//        pulse.autoreverses  = true // Determines if the receiver plays in the reverse upon completion.
//        pulse.repeatCount   = .infinity // Determines the number of times the animation will repeat.
//        layer.add(pulse, forKey: "pulsing")
//    }
    
}
