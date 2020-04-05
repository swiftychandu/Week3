//
//  Ext+ViewController.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/4/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!

extension SecondViewController {
    func showActivity() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(collectionView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    
    }
    
    func dismissIndicator() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
}
