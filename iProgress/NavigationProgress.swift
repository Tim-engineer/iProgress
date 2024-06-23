//
//  NavigationProgress.swift
//  iProgress
//
//  Created by Tim Matlak on 23/06/2024.
//

import SwiftUI

struct NavigationProgress: View {
    @Bindable var progress: ProgressM
    
    var body: some View {
        VStack {
            StyledGauge(currentDate: Date.now, minValueDate: progress.dateFrom, maxValueDate: progress.dateTo)
            Button { } label: {
                Text(progress.details)
            }
            .buttonStyle(.bordered)
            .tint(.yellow)
            Spacer()
        }
        .navigationTitle(progress.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NavigationProgress(progress: ProgressM())
    }
}
