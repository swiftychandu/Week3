//
//  ErrorMessage.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case networkError = "Network error. Please try again"
    case invalidResponse = "Invalid Response"
    case badUrl = "Invalid URL. Please check and try again"
    case unableToDecode = "Bad data received"
}
