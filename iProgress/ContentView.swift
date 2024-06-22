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
    @Environment(\.colorScheme) var colorScheme
    
    @Query private var progresses: [Progress]
    
    @State private var showingCreate = false
    
    @State private var progressUpdate: Progress?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(progresses) { progress in
                    Section {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "aqi.medium")
                                    .imageScale(.large)
                                VStack(alignment: .leading) {
                                    Text(progress.name)
                                        .font(.headline)
                                    Text(progress.dateFrom.formatted(date: .complete, time: .omitted))
                                        .font(.caption)
                                }
                            }
                            StyledGauge2(maxValueDate: progress.dateFrom)
                        }
                    }
                    .onTapGesture {
                        progressUpdate = progress
                    }
//                    .listRowBackground(randomColor().opacity(0.8))
                }
                .onDelete(perform: deleteProgress)
            }
            .navigationTitle("iProgress")
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
        .modelContainer(for: Progress.self)
}
