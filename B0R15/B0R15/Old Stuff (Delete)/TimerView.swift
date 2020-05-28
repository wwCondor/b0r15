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
        timeLabel.backgroundColor = UIColor.clear
    }
    
    override func setupConstraints() {
        let padding = 30
        
        addConstraintsWithFormat("H:|-\(padding)-[v0]-\(padding)-|", views: timeLabel)
        addConstraintsWithFormat("V:|-\(padding)-[v0]-\(2 * padding)-|", views: timeLabel)

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
