//
//  iProgressApp.swift
//  iProgress
//
//  Created by Tim Matlak on 21/06/2024.
//

import SwiftUI
import SwiftData

@main
struct iProgressApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ProgressM.self)
        }
    }
}
