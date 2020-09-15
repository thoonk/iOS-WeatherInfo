//
//  CityTableViewCell.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/14.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell{
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

