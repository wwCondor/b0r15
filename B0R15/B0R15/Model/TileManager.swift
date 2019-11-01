//
//  TileManager.swift
//  B0R15
//
//  Created by Wouter Willebrands on 01/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

//extension UIImage {
//    func toString() -> String? {
//        let data: Data? = self.pngData()
//        return data?.base64EncodedString()
//    }
//}

class TileManager {
    
//    let puzzleBoardLauncher = PuzzleBoardLauncher()
    
    var solutionTileSequence: [UIImage]?
    var gameTileSequence: [UIImage]?
    
    // Here we have an array of images
    let gameImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]
    
    // from gameImages: [UIImage] we select 1 UIImage to be used for game
    private func randomImageProvider() -> UIImage {
        let shuffledImages = gameImages.shuffled()
        let imageForGame = shuffledImages.first!
        print("Random image provder provided: \(imageForGame)")
        return imageForGame
    }
    
    // imageForGame: UIImage needs to be divided into 16 tiles: [UIImage]
    func imageDivider() -> [UIImage] {
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
        
        return images
    }
    
    
    
    
    
//    func createGameArrays() {
//        var dividedImage = tileManager.imageDivider()
//        let voidImage: UIImage = #imageLiteral(resourceName: "1")
//
//        dividedImage.remove(at: dividedImage.count - 1)
//        dividedImage.append(voidImage)
//
//        puzzleBoardLauncher.solutionSequence = dividedImage
//        puzzleBoardLauncher.testImages = dividedImage.shuffled()
//    }
    
    
    // MARK: Closure attempt
//    func createGameArray(completion: @escaping ([UIImage]?, Error?) -> Void) {
//        var dividedImage = imageDivider()
//        let voidImage: UIImage = #imageLiteral(resourceName: "1")
//
//        dividedImage.remove(at: dividedImage.count - 1)
//        dividedImage.append(voidImage)
//
//        solutionTileSequence = dividedImage
//        print(dividedImage)
//    }
    

    
}

