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
        let gradient = LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        VStack {
            StyledGauge(currentDate: Date.now, minValueDate: progress.dateFrom, maxValueDate: progress.dateTo)
            Text(progress.details)
                .padding()
                .background(gradient.opacity(1), in: RoundedRectangle(cornerRadius: 12))
                .padding()
                .foregroundStyle(.background)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        .navigationTitle(progress.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        NavigationProgress(progress: ProgressM(details: "This is some text that shows how it looks with the gradient background and I think it looks amazing"))
    }
}
