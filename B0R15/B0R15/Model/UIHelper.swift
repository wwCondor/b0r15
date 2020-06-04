//
//  UIHelper.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

enum UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                        = view.bounds.width
        let padding: CGFloat             = 12
        let minimumItemSpacing: CGFloat  = 10
        let availableWidth               = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                    = availableWidth / 3
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
    
    static func createFourColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                        = view.bounds.width
        let padding: CGFloat             = 2
        let minimumItemSpacing: CGFloat  = 2
        let availableWidth               = width - (padding * 2) - (minimumItemSpacing * 3)
        let itemWidth                    = availableWidth / 4
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
