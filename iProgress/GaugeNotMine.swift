//
//  GaugeNotMine.swift
//  iProgress
//
//  Created by Tim Matlak on 22/06/2024.
//

import SwiftUI

struct StyledGauge: View {
    @State private var current = 157.0
    @State private var minValue = 50.0
    @State private var maxValue = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])


    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(Color.red)
        }
        .tint(gradient)
    }
}

#Preview {
    StyledGauge()
}

struct StyledGauge2: View {
    @State private var currentDate = Date()
    @State private var minValueDate = Date().addingTimeInterval(-30 * 24 * 60 * 60) // 30 days ago
    let maxValueDate: Date
    
    let gradient = Gradient(colors: [.red, .orange, .yellow, .green])
    
    
    let gradient2 = LinearGradient(colors: [.purple, .indigo, .blue, .green], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            Gauge(value: currentValue(), in: minValue()...maxValue()) {
                Image(systemName: "aqi.medium")
                    .font(.system(size: 60))
                    .foregroundStyle(gradient2)
            } currentValueLabel: {
                Text("\(dateFormatter.string(from: currentDate))")
                    .foregroundStyle(gradient2)
            } minimumValueLabel: {
                Text("\(dateFormatter.string(from: minValueDate))")
                    .foregroundColor(.purple)
            } maximumValueLabel: {
                Text("\(dateFormatter.string(from: maxValueDate))")
                    .foregroundColor(.green)
            }
            .tint(gradient2)
            .font(.caption)
        }
        .padding()
    }
    
    // Function to convert date to Double for Gauge
    func currentValue() -> Double {
        return currentDate.timeIntervalSinceReferenceDate
    }
    
    func minValue() -> Double {
        return minValueDate.timeIntervalSinceReferenceDate
    }
    
    func maxValue() -> Double {
        return maxValueDate.timeIntervalSinceReferenceDate
    }
    
    // DateFormatter for displaying dates in labels
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

#Preview {
    StyledGauge2(maxValueDate: Date.now)
}
