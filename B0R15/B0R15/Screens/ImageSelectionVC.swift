//
//  ImageSelectionVC.swift
//  B0R15
//
//  Created by Wouter Willebrands on 26/05/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

/// The delegate that will inform the GameVC that an image has been selected.
protocol ImageSelectionDelegate: class {
    func imageSelected(image: UIImage)
}

class ImageSelectionVC: UIViewController {
    
    weak var delegate: ImageSelectionDelegate!
    
    let puzzleImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]
    
    lazy var imageCollectionView: UICollectionView = {
        let layout = UIHelper.createThreeColumnFlowLayout(in: view)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemTeal
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink

        configureNavigationBar()
        configureView()

    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: SFSymbols.backIcon, style: .done, target: self, action: #selector(backButtonTapped))
        let addImageButton = UIBarButtonItem(image: SFSymbols.addIcon, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = addImageButton
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func addButtonTapped() {
        let addIageVC = AddImageVC()
        addIageVC.title = "Photo Library"
        let navigationController = UINavigationController(rootViewController: addIageVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    private func configureView() {
        view.addSubview(imageCollectionView)
        
        NSLayoutConstraint.activate([
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),// constant: 20),
            imageCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
  
}

extension ImageSelectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return puzzleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.backgroundColor = .systemPink
        cell.layer.cornerRadius = 4
        cell.layer.masksToBounds = true
        #warning("Handle case with no images, e.g. when user deletes all")
        cell.imageView.image = puzzleImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        delegate.imageSelected(image: puzzleImages[indexPath.row])
        dismiss(animated: true, completion: nil)
        
//        let imageSelected = puzzleImages[indexPath.row]
        // Pass this image through the delegate informing the GameVC an image was selected.
    }
    
}
