//
//  ThirdViewController.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/14.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var textSetCity: String?
    var textSetState: Int?
    var textSetTemperature: Double?
    var textSetRainfall: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = textSetCity
        
        switch textSetState{
        case 10:
            imageView.image = UIImage(named: "sunny")
            stateLabel.text = "맑음"
        case 11:
            imageView.image = UIImage(named: "cloudy")
            stateLabel.text = "구름"
        case 12:
            imageView.image = UIImage(named: "rainy")
            stateLabel.text = "비"
        case 13:
            imageView.image = UIImage(named: "snowy")
            stateLabel.text = "눈"
        default:
            print("ImageError")
        }
        
        let fahrenheit: Double = floor((textSetTemperature! * 1.8 + 32) * 100) / 100
        
        temperatureLabel.text = "섭씨 \(textSetTemperature!)도 / 화씨 \(fahrenheit)도"
        rainfallLabel.text = "강수확률: \(textSetRainfall!)%"
    }
}
