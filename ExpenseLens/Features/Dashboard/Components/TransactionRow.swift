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
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.headline)

                Text("\(transaction.category) · \(transaction.date)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(
               "\(transaction.amount)"
            )

        }
    }
}
