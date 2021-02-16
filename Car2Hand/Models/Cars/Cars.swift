//
//  Cars.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


class Cars {
    
    var ID: Int?
    var baslik: String?
    var model_ismi: String?
    var fiyat: Int?
    var location: Location?
    var image: String?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case baslik = "title"
        case model_ismi = "modelName"
        case fiyat = "price"
        case image = "photo"
        case location = "location"
    }
    required init?(dictionary: [String : Any]?) {
        guard let dictionary = dictionary else { return nil }
        ID = dictionary.decode(key: Keys.ID.rawValue)
        baslik = dictionary.decode(key: Keys.baslik.rawValue)
        model_ismi = dictionary.decode(key: Keys.model_ismi.rawValue)
        fiyat = dictionary.decode(key: Keys.fiyat.rawValue) ?? 0
        image = dictionary.decode(key: Keys.image.rawValue)
     // location = dictionary.decode(key: Keys.location.rawValue)
    
        if let dictionaryJSON = dictionary["location"] as? [String:Any] {
            location = Location(dictionary: dictionaryJSON)
        }
    }
}
// MARK: - Location

class Location {
    
    var cityName: String?
    var townName: String?
    
    enum Keys: String, CodingKey {
        case cityName = "cityName"
        case townName = "townName"
    }
    
    required init?(dictionary: [String : Any]?) {
        guard let dictionary = dictionary else { return nil }
        
        cityName = dictionary.decode(key: Keys.cityName.rawValue)
        townName = dictionary.decode(key: Keys.townName.rawValue)
    }
}
