//
//  GaugeNotMine.swift
//  iProgress
//
//  Created by Tim Matlak on 22/06/2024.
//

import SwiftUI

struct StyledGauge: View {
    let currentDate: Date
    let minValueDate: Date
    let maxValueDate: Date
    
    let gradient = LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        Gauge(value: currentValue(), in: minValue()...maxValue()) {
            Image(systemName: "aqi.medium")
                .imageScale(.large)
                .foregroundStyle(gradient)
        } currentValueLabel: {
            Text("\(dateFormatter.string(from: currentDate))")
                .foregroundStyle(gradient)
        } minimumValueLabel: {
            Text("\(dateFormatter.string(from: minValueDate))")
                .foregroundStyle(.yellow)
        } maximumValueLabel: {
            Text("\(dateFormatter.string(from: maxValueDate))")
                .foregroundStyle(.green)
        }
        .tint(gradient)
        .font(.caption)
        .padding()
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 16))
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
        formatter.dateStyle = .long
        return formatter
    }()
}

#Preview {
    let now = Date.now
    let oneDayAgo = Calendar.current.date(byAdding: .day, value: -1, to: now)!
    let oneDayAhead = Calendar.current.date(byAdding: .day, value: 1, to: now)!
    
    return StyledGauge(currentDate: now, minValueDate: oneDayAgo, maxValueDate: oneDayAhead)
}

struct StyledGauge2: View {
    let currentDate: Date
    let minValueDate: Date
    let maxValueDate: Date
    
    let gradient2 = Gradient(colors: [.yellow, .green])
    
    var body: some View {
        Gauge(value: currentValue(), in: minValue()...maxValue()) {
            Image(systemName: "aqi.medium")
                .imageScale(.large)
                .foregroundStyle(.secondary)
        } currentValueLabel: {
            Text("\(dateFormatter.string(from: currentDate))")
                .foregroundStyle(.secondary)
        }
        .tint(gradient2)
        .font(.caption)
        .gaugeStyle(.accessoryCircular)
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
        formatter.dateStyle = .medium
        return formatter
    }()
}

#Preview {
    let now = Date.now
    let oneDayAgo = Calendar.current.date(byAdding: .day, value: -1, to: now)!
    let oneDayAhead = Calendar.current.date(byAdding: .day, value: 1, to: now)!
    
    return StyledGauge2(currentDate: now, minValueDate: oneDayAgo, maxValueDate: oneDayAhead)
}
