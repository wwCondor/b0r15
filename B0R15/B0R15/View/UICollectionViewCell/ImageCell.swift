//
//  ImageCell.swift
//  B0R15
//
//  Created by Wouter Willebrands on 28/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class ImageCell: BCollectionViewCell {
    static let identifier = "imageCellId"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func set(follower: Follower) {
//        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
//        usernameLabel.text = follower.login
//    }
    
    private func configureView() {
        backgroundColor = .systemPurple
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(imageView)
        let padding: CGFloat = 0
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
        ])
    }
}
