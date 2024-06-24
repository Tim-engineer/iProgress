//
//  Extensions.swift
//  iProgress
//
//  Created by Tim Matlak on 24/06/2024.
//

import SwiftUI

extension Date {
    func aligningMinutesToStartOfHour() -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour], from: self)
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }
}

extension Date {
    func minutes() -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour], from: self)
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }
}
