//
//  ContentView.swift
//  iProgress
//
//  Created by Tim Matlak on 21/06/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var progresses: [ProgressM]
    
    @State private var showingCreate = false
    
    @State private var progressUpdate: ProgressM?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(progresses) { progress in
                    Section {
                        NavigationLink(value: progress) {
                            VStack(alignment: .leading) {
                                HStack {
                                    StyledGauge2(currentDate: Date.now, minValueDate: progress.dateFrom, maxValueDate: progress.dateTo)
                                    VStack(alignment: .leading) {
                                        Text(progress.name)
                                            .font(.headline)
                                        Text(progress.details)
                                            .font(.caption)
                                    }
                                    .padding(.leading, 8)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            modelContext.delete(progress)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        
                        Button {
                            progressUpdate = progress
                        } label: {
                            Label("Update", systemImage: "pencil")
                        }
                        .tint(.orange)
                    }
                    .listRowBackground(GeometryReader { geometry in
                        Color.accentColor.opacity(0.4)
                            .hueRotation(Angle(degrees: Double(geometry.frame(in: .global).minY) / 10))
                    })
                }
            }
            .navigationTitle("iProgress")
            .navigationDestination(for: ProgressM.self) { progress in
                NavigationProgress(progress: progress)
            }
            .toolbar {
                Button("Create Progress", systemImage: "plus") {
                    showingCreate.toggle()
                }
            }
            .sheet(isPresented: $showingCreate) {
                NavigationStack {
                    CreateProgress()
                }
            }
            .sheet(item: $progressUpdate) {
                progressUpdate = nil
            } content: { progress in
                NavigationStack {
                    UpdateProgress(progress: progress)
                }
            }
        }
    }
    
    func deleteProgress(_ indexSet: IndexSet) {
        for index in indexSet {
            let progress = progresses[index]
            modelContext.delete(progress)
        }
    }
    
    func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .gray, .purple, .pink, .brown, .cyan, .orange, .indigo, .mint]
        return colors.randomElement() ?? .blue
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ProgressM.self)
}
