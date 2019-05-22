//
//  PhotoDataModel.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import Foundation
typealias photoList = [PhotoListDetails]

struct PhotoListDetails: Codable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id
        case title
        case url
        case thumbnailURL = "thumbnailUrl"
    }
}
