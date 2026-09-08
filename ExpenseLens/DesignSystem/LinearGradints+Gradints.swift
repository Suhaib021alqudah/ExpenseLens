//
//  LinearGradints+Gradints.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

// LinearGradient+Gradients.swift
extension LinearGradient {
    static let primaryButton = LinearGradient(
        colors: [.teal700, .teal500],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let heroCard = LinearGradient(
        colors: [.navy, .teal600],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let appIcon = LinearGradient(
        colors: [.teal700, .teal300],
        startPoint: .top,
        endPoint: .bottom
    )
}
