//
//  CountryTableViewCell.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/12.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell{
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

