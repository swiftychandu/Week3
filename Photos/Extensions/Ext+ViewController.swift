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

extension UIViewController {
    func showDetailVC(for item: String) {
           let destinationVC = DetailViewController()
           let navController = UINavigationController(rootViewController: destinationVC)
           let cacheKey = NSString(string: item)
          let image = CacheManager.shared.cache.object(forKey: cacheKey)
           destinationVC.imageView.image = image
           present(navController, animated: true)
       }
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)            
        }
    }
}
