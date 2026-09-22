//
//  CategorySpendingRow.swift
//  ExpenseLens
//
//  Created by Trainee on 16/09/2026.
//


import SwiftUI

struct CategorySpendingRow: View {

    let category: TransactionCategory
    let amount: Decimal
    let percentage: Double

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: category.iconName)
                .foregroundStyle(category.iconColor)
                .frame(width: 36, height: 36)
                .background(category.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 8) {

                Text(category.localizedTitle)
                    .font(AppTypography.rowLabel)
               
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {

                        Capsule()
                            .fill(Color.gray.opacity(0.15))

                        Capsule()
                            .fill(category.iconColor)
                            .frame(
                                width: geometry.size.width * percentage
                            )
                    }
                }
                .frame(height: 3)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 6) {

                Text(
                    amount,
                    format: .currency(code: "USD")
                )
                .font(.system(size: 14, weight: .bold))

                Text(
                    percentage,
                    format: .percent.precision(.fractionLength(0))
                )
                .font(.system(size: 10, weight: .medium))
                .foregroundStyle(category.iconColor)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
       
    }
}

#Preview {
    VStack(spacing: 12) {
        CategorySpendingRow(
            category: .shopping,
            amount: 340,
            percentage: 0.15,
           
        )

        CategorySpendingRow(
            category: .food,
            amount: 220,
            percentage: 0.10,
        )
    }
    .padding()
}
