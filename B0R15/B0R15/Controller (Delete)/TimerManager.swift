//
//  TimerManager.swift
//  B0R15
//
//  Created by Wouter Willebrands on 08/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class TimerManager: NSObject {
    
    let dismissNotification = Notification.Name(rawValue: Constants.dismissNotificationKey)

    var seconds: Int = 0
    var timer = Timer()
    var timerIsRunning = false
    var resumeTapped = false
    
    lazy var timerView: TimerView = {
        let timerView = TimerView()
        timerView.backgroundColor = UIColor(named: Colors.timerView.name)
        timerView.layer.masksToBounds = true
        return timerView
    }()
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(dismissTimer), name: dismissNotification, object: nil)
    }
    
    func showTimer() {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        if let window = window {
            
            window.addSubview(timerView)
            
            let screenWidth = window.frame.width
            let screenHeigth = window.frame.height
            
            let timerViewHeigth = screenHeigth * (1/4)
            let timerViewXOffset: CGFloat = -screenWidth
            let timerViewYOffset: CGFloat = screenHeigth * (3/4)
            timerView.frame = CGRect(x: timerViewXOffset, y: timerViewYOffset, width: screenWidth, height: timerViewHeigth)
            
            let timerMaskPath = UIBezierPath(roundedRect: timerView.bounds,
                                             byRoundingCorners: [.topRight],
                                             cornerRadii: CGSize(width: Constants.sliderCornerRadius, height: Constants.sliderCornerRadius))
            let timerShape = CAShapeLayer()
            timerShape.path = timerMaskPath.cgPath
            timerView.layer.mask = timerShape
            
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                options: .curveEaseOut,
                animations: {
                    self.timerView.center.x += self.timerView.bounds.width
            },
                completion: nil)
        }
    }
    
    // MARK: Turn into notification/delegate pattern? 
    @objc func dismissTimer(sender: NSNotification) {
        resetTimer()
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.timerView.center.x -= self.timerView.bounds.width
        },
            completion: nil)
    }
    
    func startTimer() {
        if timerIsRunning == false {
            timerIsRunning = true
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true)
        }
    }
    
    func pauseTimer() {
        // MARK: Not implemented
        // This should be called when someone clicks on for example a settings menu during game or when home is pressed
        
        // resumeTapped starts false
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            timerIsRunning = false // Otherwise after pause this is still true
        } else {
            startTimer()
            resumeTapped = false
        }
    }
    
    func resetTimer() {
        // MARK: Save time to CoreData?
        // Save only on the condition that game has ended
        timerIsRunning = false
        timer.invalidate()
        seconds = 0
        timerView.timeLabel.text = timeString(time: TimeInterval(seconds))
    }
     
    @objc func updateTimer() {
        seconds += 1
        timerView.timeLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    private func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i.%02i.%02i", hours, minutes, seconds)
    }
    
    override init() {
        super.init()
        addObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


