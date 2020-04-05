//
//  ViewController.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Photo>!
    
    var photosData: [Photo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureDatasource()
        getPhotos()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: String(describing: PhotoCell.self))
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let spacing: CGFloat = 10
        let availableWidth = width - (2 * padding) - (2 * spacing)
        let cellWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        
        return flowLayout
    }
    
    func getPhotos() {
        showActivity()
        NetworkManager.shared.fetchPhotos { [weak self] photos in
            guard let self = self else { return }
            self.dismissIndicator()
            switch photos {
            case .success(let photos):
                self.photosData = photos
                self.updateData()
            case .failure(let error): print(error.rawValue)
            }
        }
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<Section, Photo>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, photo) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCell.self), for: indexPath) as! PhotoCell
            cell.set(photo: photo)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
        snapshot.appendSections([.main])
        snapshot.appendItems(photosData)
        DispatchQueue.main.async { self.datasource.apply(snapshot, animatingDifferences: true)  }
    }
    
}


