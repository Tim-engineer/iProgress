//
//  Progress.swift
//  iProgress
//
//  Created by Tim Matlak on 21/06/2024.
//

import Foundation
import SwiftData

@Model
final class Progress {
    var name: String
    var dateFrom: Date
    var dateTo: Date
    var isCompleted: Bool
    
    init(name: String = "", dateCreated: Date = .now, dateCompleted: Date = .now, isCompleted: Bool = false) {
        self.name = name
        self.dateFrom = dateCreated
        self.dateTo = dateCompleted
        self.isCompleted = isCompleted
    }
}
