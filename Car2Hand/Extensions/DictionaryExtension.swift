//
//  DictionaryExtension.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


extension Dictionary where Key == String, Value == Any {
    
    func decode<T>(key: String) -> T? {
        guard let value = self[key] else { return nil }
        
        switch value {
        case is T:
            return value as? T
            
        case is String where T.self == Int.self:
            let result = Int(value as! String)
            return result as? T
            
        case is String where T.self == Double.self:
            let result = Double(value as! String)
            return result as? T
    
        case is Int where T.self == String.self:
            let result = String(value as! Int)
            return result as? T
            
        case is Int where T.self == Double.self:
            let result = Double(value as! Int)
            return result as? T
        
        case is Double where T.self == String.self:
            let result = String(value as! Double)
            return result as? T
            
        default:
            return nil
        }
    }
}
