//
//  DetailViewController.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = PhotoImageView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    }
    
    func configureUI() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.75),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
