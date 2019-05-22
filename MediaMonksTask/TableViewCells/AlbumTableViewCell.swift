//
//  AlbumTableViewCell.swift
//  MediaMonksTask
//
//  Created by Bharath on 22/05/19.
//  Copyright © 2019 Bharath. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var title: String = "" {
        didSet {
            self.albumLabel.text = title
        }
    }
}
