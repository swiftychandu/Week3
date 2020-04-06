//
//  AlertViewController.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    let containerView = UIView()
    let titleLabel = TitleLabel(frame: .zero)
    let messageLabel = TitleLabel(frame: .zero)
    let button = UIButton(type: .roundedRect)
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureUI()
    }
    
    @objc func dismissAlert() {
        dismiss(animated: true)
    }
    
    func configureUI() {
        let views = [titleLabel, messageLabel, button]
        for view in views {
            containerView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        button.backgroundColor = .systemPink
        button.setTitle("OK", for: .normal)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
        
        titleLabel.text = alertTitle ?? "Something went wrong"
        button.setTitle(buttonTitle ?? "Ok", for: .normal)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        messageLabel.text = message ?? "Unable to complete request."
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 44),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -12)
            
        ])
        
    }
    
    
}
