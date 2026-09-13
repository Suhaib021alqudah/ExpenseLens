//
//  TransactionRow.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct TransactionRow: View {

    let transaction: Transaction

    var body: some View {
        HStack(spacing: 12) {
            CatoegoryIcon(transaction: transaction)
            VStack(alignment: .leading) {

                Text(transaction.title)
                    .font(AppTypography.rowLabel)

                Text(
                    "\(transaction.category) · \(transaction.date.formatted(.dateTime.day().month().year()))"
                )
                .font(.caption)
                .foregroundStyle(.textSecondary)
            }
            Spacer()
            Text(
                transaction.type == .income
                    ? " +\(transaction.amount)$" : " -\(transaction.amount)$"
            )
            .foregroundStyle(transaction.type == .income ? .teal700 : .redForeground)
            .font(AppTypography.buttonTitle)

        }
    }
}

#Preview {
    let transaction: Transaction

    TransactionRow(
        transaction: Transaction(
            title: "Zara",
            amount: 983.34,
            date: Date(),
            type: .expense,
            category: .bills,
            note: "Unessecry Purshae"
        )
    )
}
