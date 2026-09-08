//
//  CategoryCard.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct CategoryCard: View {
    let item: CategoryProgress
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Image(systemName: item.category.iconName)
                .foregroundStyle(item.category.foregroundColor)
                .frame(width: 34, height: 34)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(item.category.iconBackgroundColor)
                )

            Text(item.category.title)
                .foregroundStyle(item.category.titleColor)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 6)

            Text(item.percentage, format: .percent)
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(item.percentageColor)

        }
        .frame(width: 70, height: 94)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(.whiteBackground)
        )
    }
}

#Preview {
    CategoryCard(
        item: CategoryProgress(
            category: CategoryItem(
                iconName: "basket",
                title: "Shopping",
                titleColor: .pinkForeground,
                iconBackgroundColor: .pinkBackground,
                foregroundColor: .pinkForeground
            ),
            percentage: 1.0,
            percentageColor: .pinkForeground
        ),
        isSelected: false
    )
}
