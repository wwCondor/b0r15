//
//  PuzzleBoardLauncher.swift
//  B0R15
//
//  Created by Wouter Willebrands on 27/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class PuzzleBoardLauncher: NSObject {
    
//    var solutionTileSequence: [UIImage]?
//    var gameTileSequence: [UIImage]?
    
    // Here we have an array of images
    let gameImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]
    
    var modeSelected: GameMode?
    let puzzleBoardCellId = "cellId"
    
//    puzzleBoardLauncher.solutionTileSequence = dividedImage
//    puzzleBoardLauncher.gameTileSequence = dividedImage.shuffled()
//    let tileManager = TileManager()
    
    var solutionSequence: [UIImage]?
    var testImages: [UIImage]?
    
//    lazy var testImages: [String] = ["0", "0", "0", "0",
//                      "0", "0", "0", "0",
//                      "0", "0", "0", "1",
//                      "0", "0", "0", "0"]
    
//    lazy var testImages: [String] = [String]()
    
//    lazy var tileManager = TileManager()
    
    var seconds: Int = 0
    var timer = Timer()
    var timerIsRunning = false
    var resumeTapped = false
        
    lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.alpha = 0
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:))))
        return backgroundView
    }()

    lazy var puzzleBoardView: UIView = {
        let puzzleBoardView = UIView()
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard(sender:)))
        swipeRightGesture.direction = .right
        puzzleBoardView.addGestureRecognizer(swipeRightGesture)
        puzzleBoardView.backgroundColor = UIColor(named: Color.puzzleBoard.rawValue)
        puzzleBoardView.layer.masksToBounds = true
        return puzzleBoardView
    }()
    
    lazy var puzzleBoard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let puzzleBoard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeUpGesture.direction = .up
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeRightGesture.direction = .right
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeDownGesture.direction = .down
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveInDirection(sender:)))
        swipeLeftGesture.direction = .left
        puzzleBoard.addGestureRecognizer(swipeUpGesture)
        puzzleBoard.addGestureRecognizer(swipeRightGesture)
        puzzleBoard.addGestureRecognizer(swipeDownGesture)
        puzzleBoard.addGestureRecognizer(swipeLeftGesture)
        puzzleBoard.backgroundColor = UIColor(named: Color.puzzleBoard.rawValue)
        puzzleBoard.register(PuzzleBoardCell.self, forCellWithReuseIdentifier: puzzleBoardCellId)
        puzzleBoard.dataSource = self
        puzzleBoard.delegate = self
        return puzzleBoard
    }()
    
    lazy var timerView: UIView = {
        let timerView = UIView()
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissPuzzleBoard))
        swipeLeftGesture.direction = .left
        timerView.addGestureRecognizer(swipeLeftGesture)
        timerView.backgroundColor = UIColor(named: Color.timerView.rawValue)
        timerView.layer.masksToBounds = true
        return timerView
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.backgroundColor = UIColor.clear
        timeLabel.textColor = UIColor(named: Color.timeLabelText.rawValue)
        timeLabel.text = "00.00.00"
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .semibold)
        return timeLabel
    }()
    
    func showPuzzleBoard() {
        guard let modeSelected = modeSelected else {
            return
        }
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        if let window = window {
            
            if modeSelected == .modeOne {
                backgroundView.backgroundColor = UIColor.systemPurple
            } else if modeSelected == .modeTwo {
                backgroundView.backgroundColor = UIColor.systemTeal
            }
            
            window.addSubview(backgroundView)
            window.addSubview(puzzleBoardView)
            window.addSubview(puzzleBoard)
            window.addSubview(timerView)
            window.addSubview(timeLabel)
                    
            backgroundView.frame = window.frame
            
            let screenWidth = window.frame.width
            let screenHeigth = window.frame.height
            let padding = screenWidth / 16

            let timerViewHeigth = screenHeigth * (1/4)
            let timerViewXOffset: CGFloat = -screenWidth
            let timerViewYOffset: CGFloat = screenHeigth * (3/4)
            timerView.frame = CGRect(x: timerViewXOffset, y: timerViewYOffset, width: screenWidth, height: timerViewHeigth)
            
            let timeLabelWidth = screenWidth - 2 * padding
            let timeLabelHeigth = timerViewHeigth / 2
            let timeLabelXOffset: CGFloat = -screenWidth + padding
            let timeLabelYOffset: CGFloat = screenHeigth * (3/4) + padding
            timeLabel.frame = CGRect(x: timeLabelXOffset, y: timeLabelYOffset, width: timeLabelWidth, height: timeLabelHeigth)
            
            let puzzleViewHeigth = screenHeigth * (3/4) - padding
            let puzzleViewXOffset: CGFloat = screenWidth
            let puzzleViewYOffset: CGFloat = 0
            puzzleBoardView.frame = CGRect(x: puzzleViewXOffset, y: puzzleViewYOffset, width: screenWidth, height: puzzleViewHeigth)

            let puzzleBoardSize = screenWidth - 2 * padding
            let puzzleBoardXOffset: CGFloat = screenWidth + padding
            let puzzleBoardYOffset: CGFloat = puzzleViewHeigth - puzzleBoardSize - (2 * padding)
            puzzleBoard.frame = CGRect(x: puzzleBoardXOffset, y: puzzleBoardYOffset, width: puzzleBoardSize, height: puzzleBoardSize)
            
            let maskPath = UIBezierPath(roundedRect: puzzleBoardView.bounds,
                                        byRoundingCorners: [.bottomLeft],
                                        cornerRadii: CGSize(width: Constants.sliderCornerRadius, height: Constants.sliderCornerRadius))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            puzzleBoardView.layer.mask = shape

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
                    self.backgroundView.alpha = 1
                    self.puzzleBoardView.center.x -= self.puzzleBoardView.bounds.width
                    self.puzzleBoard.center.x -= self.puzzleBoardView.bounds.width
                    self.timerView.center.x += self.timerView.bounds.width
                    self.timeLabel.center.x += self.timerView.bounds.width
            },
                completion: nil)
        }
    }
    
    @objc private func dismissPuzzleBoard(sender: UISwipeGestureRecognizer) {
        resetTimer()
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.backgroundView.alpha = 0
                self.puzzleBoardView.center.x += self.puzzleBoardView.bounds.width
                self.puzzleBoard.center.x += self.puzzleBoardView.bounds.width
                self.timerView.center.x -= self.timerView.bounds.width
                self.timeLabel.center.x -= self.timerView.bounds.width

        },
            completion: nil)
    }
    
    override init() {
        super.init()
    }
    
}

// MARK: CollectionView Delegates
extension PuzzleBoardLauncher: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    // Number of items in sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItemInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = puzzleBoard.frame.width / 4
        return CGSize(width: cellSize, height: cellSize)
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
//    cell.imageView.image = UIImage(named: testImages[index])

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = puzzleBoard.dequeueReusableCell(withReuseIdentifier: puzzleBoardCellId, for: indexPath) as! PuzzleBoardCell

        let index = indexPath.section * Constants.numberOfItemInSection + indexPath.row
        
        cell.imageView.image = testImages![index]
                    
        return cell
    }
    
    // Sets up what to do when a cell gets tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

}

// MARK: Timer
// Needs to be abstracted away from PuzzleboardLauncher
extension PuzzleBoardLauncher {
     
    // This method needs to be called when timer needs to start
    func startTimer() {
        if timerIsRunning == false {
           timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
            timerIsRunning = true
        }
    }
    
    private func pauseTimer(sender: UIButton) {
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
    
    private func resetTimer() {
        // MARK: Save time to CoreData?
        // Save only on the condition that game has ended
        timerIsRunning = false
        timer.invalidate()
        seconds = 0
        timeLabel.text = timeString(time: TimeInterval(seconds))
    }
     
    @objc func updateTimer() {
        seconds += 1
        timeLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    private func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i.%02i.%02i", hours, minutes, seconds)
    }
    
}


// MARK: Image Provider
extension PuzzleBoardLauncher {
    
    // from gameImages: [UIImage] we select 1 UIImage to be used for game
    private func randomImageProvider() -> UIImage {
        let shuffledImages = gameImages.shuffled()
        let imageForGame = shuffledImages.first!
        print("Random image provder provided: \(imageForGame)")
        return imageForGame
    }
    
    // imageForGame: UIImage needs to be divided into 16 tiles: [UIImage]
    private func imageDivider() -> [UIImage] {
        let image = randomImageProvider()
        let gameTilesPerSection: Int = Constants.numberOfItemInSection
        
        let imageWidth: CGFloat = image.size.width
        let imageHeigth: CGFloat = image.size.height
        
        let tileWidth = Int(imageWidth / CGFloat(gameTilesPerSection))
        let tileHeight = Int(imageHeigth / CGFloat(gameTilesPerSection))
        
        var adjustedHeight = tileHeight
        
        let scale = Int(image.scale) // The scale factor of the image.
        var images = [UIImage]() // The array of images returned
        let cgImage = image.cgImage! // forces data reload into memory
        
        var y = 0
        for row in 0 ..< gameTilesPerSection {
            if row == (gameTilesPerSection - 1) {
                adjustedHeight = Int(imageHeigth) - y
            }
            var adjustedWidth = tileWidth
            var x = 0
            for column in 0 ..< gameTilesPerSection {
                if column == (gameTilesPerSection - 1) {
                    adjustedWidth = Int(imageWidth) - x
                }
                let origin = CGPoint(x: x * scale, y: y * scale)
                let size = CGSize(width: adjustedWidth * scale, height: adjustedHeight * scale)
                let tileCgImage = cgImage.cropping(to: CGRect(origin: origin, size: size))!
                images.append(UIImage(cgImage: tileCgImage, scale: image.scale, orientation: image.imageOrientation))
                
                x += tileWidth
            }
            y += tileHeight
        }
        
        return images
    }
    
    func createGameArrays() {
        var dividedImage = imageDivider()
        let voidImage: UIImage = #imageLiteral(resourceName: "1")

        dividedImage.remove(at: dividedImage.count - 1)
        dividedImage.append(voidImage)

        solutionSequence = dividedImage
        testImages = dividedImage.shuffled()
    }
    
    
}




 
