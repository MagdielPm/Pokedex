//
//  TableControllerViewCell.swift
//  Pokedex
//
//  Created by InternGuest on 7/1/19.
//  Copyright © 2019 InternGuest. All rights reserved.
//

import UIKit

class TableControllerViewCell: UITableViewCell {


    @IBOutlet weak var filterImageView: UIImageView!
    
    @IBOutlet weak var filterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
