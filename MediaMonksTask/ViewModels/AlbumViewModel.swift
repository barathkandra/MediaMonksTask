//
//  AlbumViewModel.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

struct AlbumViewModel {
    
    let userID: Int
    let id: Int
    let title: String
    
    // Dependency Injection (DI)
    
    init(_ albumList: AlbumListDetails) {
        self.id = albumList.id ?? 0
        self.userID = albumList.userID ?? 0
        self.title = albumList.title ?? ""
    }
}


