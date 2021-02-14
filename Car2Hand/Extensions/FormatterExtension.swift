//
//  FormatterExtension.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
