//
//  PhotoDetailsViewController.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var titleString: String = ""
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photo Details".uppercased()

        titleLabel.text = titleString
        
        if urlString != "" {
            photoImageView.downloadImage(url: urlString, downloadComplete: nil)
        }
        // Do any additional setup after loading the view.
    }
    
}
