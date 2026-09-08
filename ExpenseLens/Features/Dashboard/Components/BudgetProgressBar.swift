//
//  CircularProgressRing.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct BudgetProgressBar: View {
    let progress: Double
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.15))

                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient.primaryButton)
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(height: 8)
    }
}

#Preview {
    BudgetProgressBar(progress: 0.5)
        .padding()
}

