//
//  Transaction.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let amount: Double
    let category: CategoryItem
}
