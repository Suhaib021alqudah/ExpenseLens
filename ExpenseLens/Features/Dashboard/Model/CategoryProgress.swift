//
//  CategoryProgress.swift
//  ExpenseLens
//
//  Created by Trainee on 08/09/2026.
//

import SwiftUI

struct CategoryProgress: Identifiable {
    var id: UUID { category.id }
    let category: CategoryItem
    let percentage: Double
    let percentageColor: Color
}
