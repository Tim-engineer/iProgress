//
//  UpdateProgress.swift
//  iProgress
//
//  Created by Tim Matlak on 21/06/2024.
//

import SwiftUI

struct UpdateProgress: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Bindable var progress: Progress
    
    var body: some View {
        Form {
            Section {
                TextField("Enter the Progress you want to track", text: $progress.name)
                    .autocorrectionDisabled()
                    .padding(.vertical)
            }
            Group {
                Section("From") {
                    DatePicker("Select the time you need the Progress to be finished", selection: $progress.dateFrom, in: Date.now...)
                }
                Section("To") {
                    DatePicker("Select the time you need the Progress to be finished", selection: $progress.dateTo, in: progress.dateFrom...)
                }
            }
            .labelsHidden()
            .datePickerStyle(.graphical)
        }
        .navigationTitle("Update Progress")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Update") {
                    context.insert(progress)
                    dismiss()
                }
                .tint(.green)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
                .tint(.red)
            }
        }
    }
}

//#Preview {
//    NavigationStack {
//        UpdateProgress()
//    }
//}
