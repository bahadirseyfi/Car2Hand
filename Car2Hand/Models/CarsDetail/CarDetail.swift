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
    var location: Location?
    var model_ismi2: String?
    var fiyat: Int?
    var tarih_format: String?
    var image: [String?]?
    var category: CarCategory?
   // var properties: [Properties?]?
    var text: String?
    var userInfo: UserInfo?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case baslik = "title"
        case model_ismi2 = "modelName"
        case fiyat = "price"
        case tarih_format = "dateFormatted"
        case image = "photos"
        case location = "location"
        case category = "category"
      //  case properties = "properties"
        case text = "text"
        case userInfo = "userInfo"
    }
    
    required init?(dictionary: [String : Any]?) {
        guard let dictionary = dictionary else { return nil }
        
        ID = dictionary.decode(key: Keys.ID.rawValue)
        baslik = dictionary.decode(key: Keys.baslik.rawValue)
        model_ismi2 = dictionary.decode(key: Keys.model_ismi2.rawValue)
        fiyat = dictionary.decode(key: Keys.fiyat.rawValue) ?? 0
        tarih_format = dictionary.decode(key: Keys.tarih_format.rawValue)
        image = dictionary.decode(key: Keys.image.rawValue) ?? []
        category = dictionary.decode(key: Keys.category.rawValue)
        text = dictionary.decode(key: Keys.text.rawValue)
        
        if let dictionaryJSON = dictionary["userInfo"] as? [String:Any] {
            userInfo = UserInfo(dictionary: dictionaryJSON)
        }
        if let dictionaryJSON2 = dictionary["location"] as? [String:Any] {
            location = Location(dictionary: dictionaryJSON2)
        }
        if let dictionaryJSON2 = dictionary["category"] as? [String:Any] {
            category = CarCategory(dictionary: dictionaryJSON2)
        }
       // if let dictionaryJSON3 = dictionary["properties"] as? [String:Any] {
       //     properties = Properties(dictionary: dictionaryJSON3)
       // }
    }
}
/*
class Properties {
    
    var name : String?
    var value : String?
    
    enum Keys: String, CodingKey {
        case name
        case value
    }
    required init?(dictionary: [[String:Any]?]) {
        guard let dictionary = dictionary else { return nil }
        name = dictionary.decode(key: Keys.name.rawValue)
        value = dictionary.decode(key: Keys.value.rawValue)
        
    }
}
*/
class CarCategory {
    var ID: Int?
    var name: String?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case name
    }
    required init?(dictionary: [String:Any]?) {
        guard let dictionary = dictionary else { return nil }
        ID = dictionary.decode(key: Keys.ID.rawValue)
        name = dictionary.decode(key: Keys.name.rawValue)
    }

    
}


class UserInfo {
    
    var ID: Int?
    var nameSurname: String?
    var phone: String?
    
    enum Keys: String, CodingKey {
        case ID = "id"
        case nameSurname
        case phone
    }
    
    required init?(dictionary: [String:Any]?) {
        guard let dictionary = dictionary else { return nil }
        
        ID = dictionary.decode(key: Keys.ID.rawValue)
        nameSurname = dictionary.decode(key: Keys.nameSurname.rawValue)
        phone = dictionary.decode(key: Keys.phone.rawValue)
    }
    
}

