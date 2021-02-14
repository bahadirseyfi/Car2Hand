//
//  DictionaryExtension.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


extension Dictionary where Key == String, Value == Any {
    
    func decode<T>(key: String) -> T? {
        guard let value = self[key] else { return nil}
        
        switch value {
        case is T:
            return value as! T
        default:
            return nil
        }
    
    }
}
