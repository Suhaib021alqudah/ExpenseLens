//
//  Category.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//



import SwiftUI

struct CategoryItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: LocalizedStringResource
    let titleColor : Color
    let iconBackgroundColor: Color
    let foregroundColor: Color
}
