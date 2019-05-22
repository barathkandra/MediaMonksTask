//
//  AlbumDataModel.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import Foundation

typealias albumList = [AlbumListDetails]

struct AlbumListDetails: Codable {
    let userID, id: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
    }
}
