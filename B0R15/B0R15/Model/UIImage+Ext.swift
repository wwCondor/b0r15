//
//  UIImage+Ext.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

extension UIImage {
    
    func createSolutionSequence() -> [UIImage]{
        let dividedImage = self.divideIntoPuzzleTiles()
        var arr = dividedImage
        arr.remove(at: dividedImage.count - 1)
        arr.append(VoidImage.clear)
        return arr
    }
    
    /// ImageForGame needs to be divided into 16 tiles
    /// - Returns: Returns an image array of the selected image which will be sed for the puzzle.
    func divideIntoPuzzleTiles() -> [UIImage] {
        let gameTilesPerSection: Int = Constants.numberOfItemsInSection
        
        let imageWidth: CGFloat  = self.size.width
        let imageHeigth: CGFloat = self.size.height
        
        let tileWidth  = Int(imageWidth / CGFloat(gameTilesPerSection))
        let tileHeight = Int(imageHeigth / CGFloat(gameTilesPerSection))
        
        var adjustedHeight = tileHeight
        
        let scale   = Int(self.scale) // The scale factor of the image.
        var images  = [UIImage]() // The array of images returned
        let cgImage = self.cgImage! // forces data reload into memory
        
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
                images.append(UIImage(cgImage: tileCGImage, scale: self.scale, orientation: self.imageOrientation))
                
                x += tileWidth
            }
            y += tileHeight
        }
        return images
    }
    
    
    /// Used to rotate the SFSymbol inthe menu button.
    /// - Parameter radians:The rotation angle in radians
    /// - Returns: The rotated UIImage
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
    
    /// Creates a rectangular transparent UIImage.
    /// - Parameters:
    ///   - color: Color of the rectangle
    ///   - size: Size of the rectangle
    public convenience init?(color: UIColor, size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}


