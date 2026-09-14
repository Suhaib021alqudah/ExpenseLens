//
//  ExpenseAnalytics.swift
//  ExpenseLens
//
//  Created by Trainee on 14/09/2026.
//

import Foundation

enum TransactionAnalytics {

    static func expenses(from transactions: [Transaction]) -> [Transaction] {
        transactions.filter { $0.type == .expense }
    }

    static func monthlyExpenses(from transactions: [Transaction]) -> Decimal {
        expenses(from: transactions).reduce(0) { $0 + $1.amount }
    }

    static func expensesByCategory(from transactions: [Transaction])
        -> [TransactionCategory: Decimal]
    {
        let expenseTransactions = expenses(from: transactions)

        return Dictionary(grouping: expenseTransactions, by: \.category)
            .mapValues { transactions in
                transactions.reduce(0) { $0 + $1.amount }
            }
    }

    static func transactions(from transactions: [Transaction], for date: Date)
        -> [Transaction]
    {
        transactions.filter { transaction in
            Calendar.current.isDate(
                transaction.date,
                equalTo: date,
                toGranularity: .month
            )
        }
    }
}
