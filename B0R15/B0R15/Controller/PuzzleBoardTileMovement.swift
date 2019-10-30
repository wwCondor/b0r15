//
//  PuzzleBoardTileMovement.swift
//  B0R15
//
//  Created by Wouter Willebrands on 29/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

extension PuzzleBoardLauncher {
    
    func shuffleArray<T>(array: Array<T>) -> Array<T> {
        var arr = array
        arr.shuffle()
        
        return arr
    }
    
    //    var testImages = ["0", "1", "0", "0",
    //                      "0", "0", "0", "0",
    //                      "0", "0", "0", "0",
    //                      "0", "0", "0", "0"]
    
    //    var indexNumbers = ["0",  "1",  "2",  "3",
    //                        "4",  "5",  "9",  "7",
    //                        "8",  "9", "10", "11",
    //                       "12", "13", "14", "15"]
    
    // First we need to know where the "1" is inside the array - check
    // Depending on position of "1" we need to disable swipe direction - check
    // When a swipe occurs that is allowed we rearrange the array accordingly
    
    @objc func moveInDirection(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            let topEdge =    [0,   1,  2,  3]
            let rightEdge =  [3,   7, 11, 15]
            let bottomEdge = [12, 13, 14, 15]
            let leftEdge =   [0,   4,  8, 12]
            
            guard let indexOfSpace = testImages.firstIndex(of:"1") else { return } // First we find position of "1"
            
            switch sender.direction {
            case .up:
                if bottomEdge.contains(indexOfSpace) == true {
                    print("Already at the bottom edge of the board")
                } else {
                    print("swiped Up")
                }
                print(indexOfSpace)
                
            case .right:
                if leftEdge.contains(indexOfSpace) == true {
                    print("Already at the left edge of the board")
                } else {
                    print("swiped Right")
                }
                print(indexOfSpace)
                
            case .down:
                if topEdge.contains(indexOfSpace) == true {
                    print("Already at the top edge of the board")
                } else {
                    print("swiped Down")
                }
                print(indexOfSpace)

            case .left:
                if rightEdge.contains(indexOfSpace) == true {
                    print("Already at the top rigth of the board")
                } else {
                    print("swiped Left")
                }
                print(indexOfSpace)
                
            default:
                print("This does not work")
            }
        }
    }
    
    private func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
    
    
}


