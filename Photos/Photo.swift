//
//  Photo.swift
//  Photos
//
//  Created by chandrasekhar yadavally on 4/3/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

struct Photo: Codable, Hashable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
}
