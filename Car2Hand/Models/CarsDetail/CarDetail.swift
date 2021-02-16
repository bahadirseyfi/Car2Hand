//
//  CarDetail.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import Foundation


class CarDetail {
    
    var ID: Int?
    var baslik: String?
    var model_ismi: String?
    var fiyat: Int?
    var tarih_format: String?
    var image: [String?]?
    var text: String?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case baslik = "title"
        case model_ismi = "modelName"
        case fiyat = "price"
        case tarih_format = "dateFormatted"
        case image = "photo"
        case location = "location"
        case text = "text"
    }
    
    required init?(dictionary: [String : Any]?) {
        guard let dictionary = dictionary else { return nil }
        
        ID = dictionary.decode(key: Keys.ID.rawValue)
        baslik = dictionary.decode(key: Keys.baslik.rawValue)
        model_ismi = dictionary.decode(key: Keys.model_ismi.rawValue)
        fiyat = dictionary.decode(key: Keys.fiyat.rawValue) ?? 0
        tarih_format = dictionary.decode(key: Keys.tarih_format.rawValue)
        image = dictionary.decode(key: Keys.image.rawValue) ?? []
        text = dictionary.decode(key: Keys.text.rawValue)
    }
}
