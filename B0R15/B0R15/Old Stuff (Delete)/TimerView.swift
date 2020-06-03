//
//  TimerView.swift
//  B0R15
//
//  Created by Wouter Willebrands on 08/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class TimerView: CustomView {
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.backgroundColor = UIColor.clear
        timeLabel.textColor = UIColor(named: Colors.timeLabelText.name)
        timeLabel.text = "00.00.00"
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .semibold)
        return timeLabel
    }()
    
    override func setupView() {
        addSubview(timeLabel)
        timeLabel.pinToEdges(of: self)
        timeLabel.backgroundColor = UIColor.clear
    }
}

class CustomView: UIView {
    
    //init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    //init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }
    
    func setupView() {

    }
    
    func setupConstraints() {

    }
}
