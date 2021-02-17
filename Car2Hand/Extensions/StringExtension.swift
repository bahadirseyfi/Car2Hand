//
//  StringExtension.swift
//  Car2Hand
//
//  Created by bahadir on 17.02.2021.
//

import Foundation

extension String {
    var wordList: [String] {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).filter { !$0.isEmpty }
    }
}
