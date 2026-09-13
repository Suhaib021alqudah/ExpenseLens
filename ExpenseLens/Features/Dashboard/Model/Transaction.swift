//
//  Transaction.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = UUID()
    let title: String
    let amount: Decimal
    let date: Date
    let type: TransactionType
    let category: TransactionCategory
    let note: String?
}

enum TransactionType: String {
    case expense = "Expense"
    case income = "Income"
}

enum TransactionCategory: String {
    case shopping
    case food
    case transport
    case bills
    case health
    case entertainment
    case house
    case education
    case travel
    case subscriptions
    case personalCare
    case other
}

extension TransactionCategory {

    var iconName: String {
        switch self {
        case .food:
            return "fork.knife"

        case .shopping:
            return "bag"

        case .transport:
            return "car"

        case .bills:
            return "doc.text"

        case .health:
            return "cross"

        case .entertainment:
            return "gamecontroller"

        case .house:
            return "house"
        case .education:
            return "graduationcap"
        case .travel:
            return "airplane.up.forward"
        case .subscriptions:
            return "arrow.2.squarepath"
        case .personalCare:
            return "person"
        case .other:
            return "tag"

        }

    }

    var iconColor: Color {
        switch self {

        case .shopping:
            return .pinkForeground
        case .food:
            return .yellowForeground

        case .transport:
            return .purpleForeground

        case .bills:
            return .navyForeground
        case .health:
            return .redForeground

        case .entertainment:
            return .purpleForeground
        case .house:
            return .navyForeground
        case .education:
            return .teal500
        case .travel:
            return .yellowForeground
        case .subscriptions:
            return .purpleForeground
        case .personalCare:
            return .pinkForeground
        case .other :
            return .greyForeground

        }
    }

    var backgroundColor: Color {
        
        switch self {

        case .shopping:
            return .pinkBackground
        case .food:
            return .yellowBackground

        case .transport:
            return .purpleBackground

        case .bills:
            return .navyBackround
        case .health:
            return .redBackground

        case .entertainment:
            return .purpleBackground
        case .house:
            return .navyBackround
        case .education:
            return .teal700
        case .travel:
            return .yellowBackground
        case .subscriptions:
            return .purpleBackground
        case .personalCare:
            return .pinkBackground
        case .other :
            return .greyBackground

        }

    }
}
