//
//  Scoreboard.swift
//  B0R15
//
//  Created by Wouter Willebrands on 08/11/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class Scoreboard: UIView {
    
    let scoreCellId = "cellId"
    
    lazy var scoreboard: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let scoreboard = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scoreboard.register(ScoreboardCell.self, forCellWithReuseIdentifier: scoreCellId)
        scoreboard.dataSource = self
        scoreboard.delegate = self
        scoreboard.layer.masksToBounds = true
        return scoreboard
    }()
    
    //init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    //init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        addSubview(scoreboard)
        scoreboard.backgroundColor = UIColor.clear
    }
    
    func setupConstraints() {
//        let padding = 30
        
        scoreboard.pinToEdges(of: self)
    }
}

extension Scoreboard: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Number of cell per row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = scoreboard.frame.width * (3/4)
        let cellHeigth = scoreboard.frame.height / 6
        return CGSize(width: cellWidth, height: cellHeigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Content of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scoreboard.dequeueReusableCell(withReuseIdentifier: scoreCellId, for: indexPath) as! ScoreboardCell

        return cell
    }
    
}
