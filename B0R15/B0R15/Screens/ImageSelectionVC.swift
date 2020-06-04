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
    
    enum Section { case main }
    
    weak var delegate: ImageSelectionDelegate!
    
    private var puzzleImages: [UIImage] = [
        UIImage(named: "Groovy")!,
        UIImage(named: "Wizard")!,
        UIImage(named: "Invader")!,
        UIImage(named: "Knight")!
    ]
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, UIImage>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureNavigationBar()
        configureCollectionView()
        updateData()
        configureDataSource()
    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: SFSymbols.backIcon, style: .done, target: self, action: #selector(backButtonTapped))
        let addImageButton = UIBarButtonItem(image: SFSymbols.addIcon, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = addImageButton
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, UIImage>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, image) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            cell.imageView.image = self.puzzleImages[indexPath.row]
            cell.setCornerRadius(to: 8)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UIImage>()
        snapshot.appendSections([.main])
        snapshot.appendItems(puzzleImages)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true)}
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
}

extension ImageSelectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        delegate.imageSelected(image: puzzleImages[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
