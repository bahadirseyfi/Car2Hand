//
//  CarsResponse.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class CarsResponse : Initializer {
    var cars: [Cars] = []
   
    
    enum Keys: String, CodingKey {
        case root
    }
    
    required init(){}
    required init?(dictionary: [String:Any]?) {
        guard let dictionary = dictionary else { return nil }
        if let cars: [[String:Any]] = dictionary.decode(key: Keys.root.rawValue) {
            for each in cars {
                if let car = Cars(dictionary: each) {
                    self.cars.append(car)
                }
            }
        }
    }
}
