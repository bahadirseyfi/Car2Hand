//
//  CarsRequest.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class CarsRequest {
    var cars: String?
    
    enum Keys: String, CodingKey {
        case sort = "sort"
        case sortDirection = "sortDirection"
        case take = "take"
    }
    func dictionary()->[String:Any] {
        var dictionary: [String:Any] = [:]
        dictionary[Keys.sort.rawValue] = cars
        dictionary[Keys.sortDirection.rawValue] = cars
        dictionary[Keys.take.rawValue] = cars
        return dictionary
    }
}
