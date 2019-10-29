//
//  TimerContainer.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

//class TimerContainer: UIView {
//    
////    let gameTimer = GameTimer()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupView()
//    }
//    
//    lazy var timeLabel: UILabel = {
//        let timeLabel = UILabel()
//        timeLabel.text = ""
//        return timeLabel
//    }()
//    
//    private func setupView() {
////        gameTimer.runTimer()
//        self.backgroundColor = UIColor.systemYellow
//        
//        self.addSubview(timeLabel)
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
//        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//        timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
//
//    }
//    
//    
//}

//class GameTimer {
//
//    let timerContainer = TimerContainer()
//
//    var timer = Timer()
//    var seconds: Int = 60
//    var timerIsRunning = false
//
//    // This function should be called whereever we want to start the time
//    func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
//    }
//
//    @objc func updateTimer() {
//        seconds += 1     //This will decrement(count down)the seconds.
//        timerContainer.timeLabel.text = "\(seconds)" //This will update the label.
//    }
//
//    func pauseTimer() {
//        timer.invalidate()
//    }
//
//    func resetTimer() {
//        timerContainer.timeLabel.text = "\(seconds)"
//    }
//
//
//}
