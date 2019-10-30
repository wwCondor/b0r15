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
            
            guard let indexOfSpace = testImages.firstIndex(of:"1") else { return } // Here we find position of "1"
            // MARK: Change to imageName
            
            switch sender.direction {
            case .up:
                if bottomEdge.contains(indexOfSpace) == true {
                    print("Already at the bottom edge of the board")
                    // MARK: Animation/Sound
                } else {
                    testImages = rearrange(array: testImages, fromIndex: indexOfSpace, toIndex: indexOfSpace + 4)
                    compareWithSolution()
//                    print(testImages)
//                    print("swiped up")
                }
//                print(indexOfSpace)
                
            case .right:
                if leftEdge.contains(indexOfSpace) == true {
                    print("Already at the left edge of the board")
                } else {
                    testImages = rearrange(array: testImages, fromIndex: indexOfSpace, toIndex: indexOfSpace - 1)
                    compareWithSolution()
//                    print(testImages)
//                    print("swiped right")
                }
//                print(indexOfSpace)
                
            case .down:
                if topEdge.contains(indexOfSpace) == true {
                    print("Already at the top edge of the board")
                } else {
                    testImages = rearrange(array: testImages, fromIndex: indexOfSpace, toIndex: indexOfSpace - 4)
                    compareWithSolution()
//                    print(testImages)
//                    print("swiped down")
                }
//                print(indexOfSpace)

            case .left:
                if rightEdge.contains(indexOfSpace) == true {
                    print("Already at the right of the board")
                } else {
                    testImages = rearrange(array: testImages, fromIndex: indexOfSpace, toIndex: indexOfSpace + 1)
                    compareWithSolution()
//                    print(testImages)
//                    print("swiped left")
                }
//                print(indexOfSpace)
                
            default:
                print("This does not work")
            }
            
            puzzleBoard.performBatchUpdates({
                puzzleBoard.reloadItems(at: self.puzzleBoard.indexPathsForVisibleItems)
            }, completion: nil)
        }
    }
    
    private func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
    
    private func compareWithSolution() {
        // MARK: Solution
        let solutionArray = ["0", "0", "0", "0",
                             "0", "0", "0", "0",
                             "0", "0", "0", "0",
                             "0", "0", "0", "1"]
        
        if testImages == solutionArray {
            print("Arrays match!")
        }
    }
    
}


