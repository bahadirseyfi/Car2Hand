//
//  Cars.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


class Cars {
    
    let ID: Int?
    var baslik: String?
    var model_ismi: String?
    var fiyat: Int?
    var priceFormatted: String?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case baslik = "title"
        case model_ismi = "modelName"
        case fiyat = "price"
        
    }
    
    required init?(dictionary: [String : Any]?) {
        guard let dictionary = dictionary else { return nil }
        
        ID = dictionary.decode(key: Keys.ID.rawValue)
        baslik = dictionary.decode(key: Keys.baslik.rawValue)
        model_ismi = dictionary.decode(key: Keys.model_ismi.rawValue)
        fiyat = dictionary.decode(key: Keys.fiyat.rawValue) ?? 0

    }
}
