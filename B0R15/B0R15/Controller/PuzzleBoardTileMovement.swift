//
//  PuzzleBoardTileMovement.swift
//  B0R15
//
//  Created by Wouter Willebrands on 29/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

extension PuzzleBoardLauncher {
    
    @objc func moveInDirection(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .up:
                print("swiped Up")
                
            case .right:
                print("swiped Right")
                
            case .down:
                print("swiped Down")
                
            case .left:
                print("swiped Left")
                
            default:
                print("This does not work")
            }
        }
    }
    
    
}


