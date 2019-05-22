//
//  PhotoTableViewCell.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var thumbUrl: String = "" {
        didSet {
            self.thumbImage.downloadImage(url: thumbUrl, downloadComplete: nil)
        }
    }
    
    var titleValue: String = "" {
        didSet {
            self.titleLabel.text = titleValue
        }
    }


}
