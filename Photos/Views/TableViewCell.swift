//
//  TableViewCell.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let photoImageView = PhotoImageView(frame: .zero)
    let label = TitleLabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(photo: Photo) {
          photoImageView.downloadImage(from: photo.url)
          label.text = photo.title
      }
    
    func configure() {
        addSubview(photoImageView)
        addSubview(label)
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            
        label.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
        label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
        label.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        label.heightAnchor.constraint(equalToConstant: bounds.height * 0.5)
        ])
    }
}
