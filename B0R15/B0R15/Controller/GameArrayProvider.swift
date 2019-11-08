//
//  GameArrayProvider.swift
//  B0R15
//
//  Created by Wouter Willebrands on 01/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

// Random (square) image API: https://picsum.photos/200 // Where 200 is image size which can be in/decreased

import UIKit

//            let solutionSequence = ["0", "0", "0", "0",
//                                    "0", "0", "0", "0",
//                                    "0", "0", "0", "0",
//                                    "0", "0", "0", "1"]

class GameArrayProvider {
    
    let puzzleBoardManager = PuzzleBoardManager()
    
    var solutionSequence: [UIImage] = []
    var gameSequence: [UIImage] = []
    
    let gameImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]
    
    // from gameImages we randomly select 1 image to be used for game
    private func randomImageProvider() -> UIImage {
        let shuffledImages = gameImages.shuffled()
        let imageForGame = shuffledImages.first!
        print("Random image provder provided: \(imageForGame)")
        return imageForGame
    }
    
    // imageForGame needs to be divided into 16 tiles
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
                let tileCGImage = cgImage.cropping(to: CGRect(origin: origin, size: size))!
                images.append(UIImage(cgImage: tileCGImage, scale: image.scale, orientation: image.imageOrientation))
                
                x += tileWidth
            }
            y += tileHeight
        }
//        print("Divided image: \(images)")
        return images
    }
    
    private func provideSolutionSequence() -> [UIImage]{
        let dividedImage = imageDivider()
        var arr = dividedImage
        let voidImage: UIImage = #imageLiteral(resourceName: "1")
        arr.remove(at: dividedImage.count - 1)
        arr.append(voidImage)
//        print("Divided image with void: \(arr)")
        return arr
    }
    
    func createGameArrays() {
        let solutionArray = provideSolutionSequence()
        let puzzleArray = solutionArray.shuffled()
        
        solutionSequence = solutionArray
        gameSequence = puzzleArray
    }
}

