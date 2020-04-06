//
//  Imagecache_ViewModel.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/5/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class CacheManager {
    static let shared = CacheManager()
    let cache = NSCache<NSString, UIImage>()
    private init() { }
}
