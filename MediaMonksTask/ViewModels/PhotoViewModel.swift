//
//  PhotoViewModel.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import Foundation

struct PhotoViewModel {
    
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailURL: String
   
    // Dependency Injection (DI)
    
    init(_ photoList: PhotoListDetails) {
        self.id = photoList.id ?? 0
        self.albumID = photoList.albumID ?? 0
        self.title = photoList.title ?? ""
        self.url = photoList.url ?? ""
        self.thumbnailURL = photoList.thumbnailURL ?? ""
    }
}
