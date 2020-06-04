////
////  PuzzleBoardLauncher.swift
////  B0R15
////
////  Created by Wouter Willebrands on 27/10/2019.
////  Copyright © 2019 Studio Willebrands. All rights reserved.
////
//
//import UIKit
//
//class PuzzleBoardManager: NSObject {
//    
//    let dismissNotification = Notification.Name(rawValue: Constants.dismissNotificationKey)
//    
//    lazy var gameArrayProvider = GameArrayProvider()
// 
//    var modeSelected: GameMode?
//    let puzzleBoardCellId = "cellId"
//        
//    var gameSequence: [UIImage] = []
//    var solutionSequence: [UIImage] = []
//        
//    lazy var backgroundView: UIView = {
//        let backgroundView = UIView()
//        backgroundView.alpha = 0
//        // MARK: Refactor
//        // This responsibilty should eventually be held by the object(s) that handle(s) the end of a game e.g.
//        // - When user completes puzzle
//        // - When user opts to quit an uncompleted game (e.g. in a popdown (settings)menu)
//        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:))))
//        return backgroundView
//    }()
//    // For example:
//    @objc private func endGame(sender: UITapGestureRecognizer) {
//        // This method should post the notification that dismisses timer and puzzleboard
//        // As well as handle the logic to set up new game:
////        NotificationCenter.default.post(name: dismissNotification, object: nil)
////        gameArrayProvider.gameSequence.removeAll()
////        gameArrayProvider.solutionSequence.removeAll()
////        gameSequence.removeAll()
////        solutionSequence.removeAll()
//    }
//
//    // Turn into customView?
//    lazy var puzzleBoardView: UIView = {
//        let puzzleBoardView = UIView()
////        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:)))
////        swipeRightGesture.direction = .right
////        puzzleBoardView.addGestureRecognizer(swipeRightGesture)
//        puzzleBoardView.backgroundColor = UIColor(named: Colors.puzzleBoard.name)
//        puzzleBoardView.layer.masksToBounds = true
//        return puzzleBoardView
//    }()
//    
//    // Move to separate class?
//    lazy var puzzleBoard: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeUpGesture.direction = .up
//        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeRightGesture.direction = .right
//        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeDownGesture.direction = .down
//        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
//        swipeLeftGesture.direction = .left
//        puzzleBoard.addGestureRecognizer(swipeUpGesture)
//        puzzleBoard.addGestureRecognizer(swipeRightGesture)
//        puzzleBoard.addGestureRecognizer(swipeDownGesture)
//        puzzleBoard.addGestureRecognizer(swipeLeftGesture)
//        puzzleBoard.backgroundColor = UIColor(named: Colors.puzzleBoard.name)
//        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
//        puzzleBoard.dataSource = self
//        puzzleBoard.delegate = self
//        return puzzleBoard
//    }()
//    
//    func showPuzzleBoard() {
//        guard let modeSelected = modeSelected else { return }
//        
//        updatePuzzleBoard()
//        
//        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
//        
//        if let window = window {
//            
//            if modeSelected == .modeOne {
//                backgroundView.backgroundColor = UIColor.systemPurple
//            } else if modeSelected == .modeTwo {
//                backgroundView.backgroundColor = UIColor.systemTeal
//            }
//            
//            window.addSubview(backgroundView)
//            window.addSubview(puzzleBoardView)
//            window.addSubview(puzzleBoard)
//                    
//            backgroundView.frame = window.frame
//            
//            let screenWidth = window.frame.width
//            let screenHeigth = window.frame.height
//            let padding = screenWidth / 16
//            
//            let puzzleViewHeigth = screenHeigth * (3/4) - padding
//            let puzzleViewXOffset: CGFloat = screenWidth
//            let puzzleViewYOffset: CGFloat = 0
//            puzzleBoardView.frame = CGRect(x: puzzleViewXOffset, y: puzzleViewYOffset, width: screenWidth, height: puzzleViewHeigth)
//
//            let puzzleBoardSize = screenWidth - 2 * padding
//            let puzzleBoardXOffset: CGFloat = screenWidth + padding
//            let puzzleBoardYOffset: CGFloat = puzzleViewHeigth - puzzleBoardSize - (2 * padding)
//            puzzleBoard.frame = CGRect(x: puzzleBoardXOffset, y: puzzleBoardYOffset, width: puzzleBoardSize, height: puzzleBoardSize)
//            
//            let maskPath = UIBezierPath(roundedRect: puzzleBoardView.bounds,
//                                        byRoundingCorners: [.bottomLeft],
//                                        cornerRadii: CGSize(width: Constants.sliderCornerRadius, height: Constants.sliderCornerRadius))
//            let shape = CAShapeLayer()
//            shape.path = maskPath.cgPath
//            puzzleBoardView.layer.mask = shape
//            
//            UIView.animate(
//                withDuration: 0.8,
//                delay: 0,
//                options: .curveEaseOut,
//                animations: {
//                    self.backgroundView.alpha = 1
//                    self.puzzleBoardView.center.x -= self.puzzleBoardView.bounds.width
//                    self.puzzleBoard.center.x -= self.puzzleBoardView.bounds.width
//            },
//                completion: nil)
//        }
//    }
//    
//    private func resetGame() {
//        NotificationCenter.default.post(name: dismissNotification, object: nil)
//        gameArrayProvider.gameSequence.removeAll()
//        gameArrayProvider.solutionSequence.removeAll()
//        gameSequence.removeAll()
//        solutionSequence.removeAll()
//    }
//    
//    // This needs to be called
//    @objc private func dismissPuzzleBoard(sender: UITapGestureRecognizer) {
//        resetGame()
//        UIView.animate(
//            withDuration: 0.5,
//            delay: 0,
//            options: .curveEaseIn,
//            animations: {
//                self.backgroundView.alpha = 0
//                self.puzzleBoardView.center.x += self.puzzleBoardView.bounds.width
//                self.puzzleBoard.center.x += self.puzzleBoardView.bounds.width
//        },
//            completion: nil)
//    }
//    
//    override init() {
//        super.init()
//    }
//    
//}
//
//// MARK: CollectionView Delegates
//extension PuzzleBoardManager: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    // Number of sections
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return Constants.numberOfSections
//    }
//
//    // Number of items in sections
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Constants.numberOfItemInSection
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    // Size of cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellSize = puzzleBoard.frame.width / 4
//        return CGSize(width: cellSize, height: cellSize)
//    }
//
//    // Space between cells
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    // Content of cell
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell
//
//        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
//
////        let voidImage: UIImage = #imageLiteral(resourceName: "1")
////
////        if index == 1 {
////            cell.imageView.image = voidImage
////        } else {
////            cell.imageView.image = gameSequence[index]
////        }
//
//        cell.imageView.image = gameSequence[index]
//
//        return cell
//    }
//
//    // Sets up what to do when a cell gets tapped (maybe add some hidden animation?)
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath)
//    }
//
//}
//
//// MARK: Tile Movement Logic
//extension PuzzleBoardManager {
//    
//    private func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
//        var arr = array
//        arr.swapAt(fromIndex, toIndex)
//        return arr
//    }
//    
//    @objc func moveInDirection(sender: UISwipeGestureRecognizer) {
//        if sender.state == .ended {
//            let topEdge =    [ 0,  1,  2,  3]
//            let rightEdge =  [ 3,  7, 11, 15]
//            let bottomEdge = [12, 13, 14, 15]
//            let leftEdge =   [ 0,  4,  8, 12]
//            
////            let voidImage: UIImage = gameArrayProvider.voidImage
////            print(voidImage)
//            let voidImage = VoidImage.clear
//            
//            // First check position of voidImage
//            guard let indexOfSpace = gameSequence.firstIndex(of: voidImage) else {
//                print("Image array does not contain an empty tile")
//                return
//            }
//            
//            switch sender.direction {
//            case .up:
//                if bottomEdge.contains(indexOfSpace) == true {
//                    print("Already at the bottom edge of the board")
//                    // MARK: Animation/Sound
//                } else {
//                    gameSequence = rearrange(array: gameSequence, fromIndex: indexOfSpace, toIndex: indexOfSpace + 4)
////                    print(gameSequence)
////                    print("swiped up")
//                }
//                //                print(indexOfSpace)
//                
//            case .right:
//                if leftEdge.contains(indexOfSpace) == true {
//                    print("Already at the left edge of the board")
//                } else {
//                    gameSequence = rearrange(array: gameSequence, fromIndex: indexOfSpace, toIndex: indexOfSpace - 1)
////                    print("swiped right")
//                }
//                
//            case .down:
//                if topEdge.contains(indexOfSpace) == true {
//                    print("Already at the top edge of the board")
//                } else {
//                    gameSequence = rearrange(array: gameSequence, fromIndex: indexOfSpace, toIndex: indexOfSpace - 4)
////                    print("swiped down")
//                }
//                
//            case .left:
//                if rightEdge.contains(indexOfSpace) == true {
//                    print("Already at the right of the board")
//                } else {
//                    gameSequence = rearrange(array: gameSequence, fromIndex: indexOfSpace, toIndex: indexOfSpace + 1)
////                    print("swiped left")
//                }
//                
//            default:
//                print("This does not work")
//            }
//            updatePuzzleBoard()
//            compareArrays()
//        }
//    }
//    
//    private func updatePuzzleBoard() {
//        puzzleBoard.performBatchUpdates({
//            puzzleBoard.reloadItems(at: self.puzzleBoard.indexPathsForVisibleItems)
//        }, completion: nil)
//    }
//    
//    // MARK: Solution
//    private func compareArrays() {
//        if gameSequence == solutionSequence {
//            // In here we should end game
//            print("Arrays match!")
//        } else {
//            
//        }
//    }
//    
//}
//
//
//
//
// 
