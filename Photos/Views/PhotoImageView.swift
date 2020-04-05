//
//  PhotosImageView.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class PhotoImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
         let url = URLRequest(url: URL(string: urlString)!)      
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil {
                print("error 1")
                return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error 2")
                return }
            guard let data = data else {
                print("Error 3")
                return }
            guard let image = UIImage(data: data) else {
                print("Error 4")
                return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
}

