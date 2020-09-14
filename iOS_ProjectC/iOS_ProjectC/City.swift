//
//  City.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/14.
//  Copyright © 2020 thoonk. All rights reserved.
//

import Foundation

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }
}


//{
//   "city_name":"파리",
//   "state":10,
//   "celsius":11.3,
//   "rainfall_probability":90
//}
