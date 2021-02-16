//
//  CarDetailRequest.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import Foundation


import Foundation

class CarDetailRequest {
    
    var cars: String?
    
    enum Keys: String, CodingKey {
        case id = "id"
        
    }
    func dictionary()->[String:Any] {
        var dictionary: [String:Any] = [:]
        dictionary[Keys.id.rawValue] = cars
        return dictionary
    }
}
