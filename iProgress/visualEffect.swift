//
//  visualEffect.swift
//  iProgress
//
//  Created by Tim Matlak on 24/06/2024.
//

import SwiftUI

struct visualEffect: View {
    var body: some View {
        ScrollView {
            ForEach(1..<20) { _ in
                RoundedRectangle(cornerRadius: 22)
                    .fill(.blue.opacity(0.8))
                    .frame(height: 100)
                    .visualEffect { content, proxy in
                        content.hueRotation(Angle(degrees: proxy.frame(in: .global).origin.y / 5))
                    }
            }
        }
    }
}

#Preview {
    visualEffect()
}
