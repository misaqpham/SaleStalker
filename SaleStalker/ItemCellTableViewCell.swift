//
//  ItemCellTableViewCell.swift
//  SaleStalker
//
//  Created by Misa Pham on 2/22/16.
//  Copyright © 2016 Misa Pham. All rights reserved.
//

import Foundation


import UIKit

class ItemCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameText: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalVotesLabel: UILabel!
    @IBOutlet weak var thumbVoteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
