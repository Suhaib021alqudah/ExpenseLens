//
//  CircularProgressRing.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct CircularProgress: View {
    let progress: Double
    private var percentageText: String {
        "\(Int(progress * 100))%"
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.15), lineWidth: 12)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.teal600,
                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))

            VStack(spacing: 4) {
                Text(percentageText)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.textPrimary)
                Text(.used)
                    .font(.system(size: 12))
                    .foregroundStyle(.textSecondary)
            }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    CircularProgress(progress: 0.8)
}
