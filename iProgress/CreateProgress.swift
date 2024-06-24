//
//  CreateProgress.swift
//  iProgress
//
//  Created by Tim Matlak on 21/06/2024.
//

import SwiftUI

struct CreateProgress: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var progress = ProgressM()
    
    var disabled: Bool {
        progress.name.isEmpty
    }
    
    var body: some View {
        Form {
            Group {
                Section {
                    TextField("Name of the Progress", text: $progress.name)
                        .font(.headline)
                }
                Section {
                    TextField("Description of the Progress", text: $progress.details)
                        .font(.caption)
                }
            }
            .autocorrectionDisabled()
            .padding(.vertical, 8)
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
        .navigationTitle("Create Progress")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Create") {
                    context.insert(progress)
                    dismiss()
                }
                .tint(.green)
//                .disabled(disabled)
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

#Preview {
    NavigationStack {
        CreateProgress()
    }
}
