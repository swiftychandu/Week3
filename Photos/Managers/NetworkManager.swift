//
//  NetworkManager.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let link = "https://jsonplaceholder.typicode.com/photos"
    
    private init() { }
    
    func fetchPhotos(handler: @escaping (Result<[Photo], ErrorMessage>) -> Void) {
        let url = URLRequest(url: URL(string: link)!)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error { handler(.failure(.networkError))}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                handler(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                handler(.failure(.unableToDecode))
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let photos = try decoder.decode([Photo].self, from: data)
                handler(.success(photos))
            } catch {
                handler(.failure(.unableToDecode))
            }
            
        }.resume()
        
    }
}
