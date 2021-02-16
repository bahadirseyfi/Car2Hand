//
//  CarDetailResponse.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import Foundation

class CarDetailResponse : Initializer {
    
    var cars: CarDetail?

    enum Keys: String, CodingKey {
        case root
    }
    
    required init(){}
    required init?(dictionary: [String:Any]?) {
        guard let dictionary = dictionary else { return nil }
        if let cars: [String:Any] = dictionary.decode(key: Keys.root.rawValue) {
                if let car = CarDetail(dictionary: cars) {
                    self.cars = car
            }
        }
    }
}
