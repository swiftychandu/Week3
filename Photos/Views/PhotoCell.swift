//
//  PhotoCell.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    let titleLabel = TitleLabel(frame: .zero)
    let photoImageView = PhotoImageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(photo: Photo) {
        photoImageView.downloadImage(from: photo.url)
        print(photo.url)
        titleLabel.text = photo.title
    }
    
    func configure() {
        backgroundColor = .systemBackground
        addSubview(titleLabel)
        addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)            
        ])
        
    }
}
