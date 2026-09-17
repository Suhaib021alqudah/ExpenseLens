//
//  CategoryProgress.swift
//  ExpenseLens
//
//  Created by Trainee on 08/09/2026.
//

import SwiftUI

struct CategoryProgress: Identifiable {
    var id: TransactionCategory { transactionCategory }

    let transactionCategory: TransactionCategory
    let category: CategoryItem
    let percentage: Double
    let percentageColor: Color
}
