//
//  ProgressM.swift
//  iProgress
//
//  Created by Tim Matlak on 22/06/2024.
//

import Foundation
import SwiftData

@Model
final class ProgressM {
    var name: String
    var details: String
    var dateFrom: Date
    var dateTo: Date
    var isCompleted: Bool
    
    init(name: String = "", details: String = "", dateFrom: Date = .now, dateTo: Date = .now, isCompleted: Bool = false) {
        self.name = name
        self.details = details
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.isCompleted = isCompleted
    }
}
