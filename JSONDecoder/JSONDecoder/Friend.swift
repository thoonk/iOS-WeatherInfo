//
//  Friend.swift
//  JSONDecoder
//
//  Created by 김태훈 on 2020/09/11.
//  Copyright © 2020 thoonk. All rights reserved.
//

import Foundation

struct Friend: Codable{
    struct Address: Codable {
        let country: String
        let city: String
    }

    let name: String
    let age: Int
    let addressInfo: Address
    
        
    enum CodingKeys: String, CodingKey{
        case name, age
        case addressInfo = "address_info"
    }
    
    var nameAndAge: String{
        return self.name + "(\(self.age))"
    }
    
    var fullAddress: String{
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
}
 
/*

{
    "name":"하나",
    "age":22,
    "address_info": {
        "country":"대한민국",
        "city":"울산"
    }
}
*/
