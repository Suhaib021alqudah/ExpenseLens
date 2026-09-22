//
//  ExpenseAnalytics.swift
//  ExpenseLens
//
//  Created by Trainee on 14/09/2026.
//

import Foundation

enum TransactionAnalytics {

    //Filtring the transactions here we just need the expense and removing the Income transactionse
    static func expenses(from transactions: [Transaction]) -> [Transaction] {
        transactions.filter { $0.type == .expense }
    }

    //Filtering transcations by month
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

    
    //Calculate the expenses in specific month using transactions() function
    static func monthlyExpenses(from transactions: [Transaction]) -> Decimal {
        expenses(from: transactions).reduce(0) { $0 + $1.amount }
    }

    //Group the transactionds using the Dictionary
    static func expensesByCategory(from transactions: [Transaction])
        -> [TransactionCategory: Decimal]
    {
        let expenseTransactions = expenses(from: transactions)

        return Dictionary(grouping: expenseTransactions, by: \.category)
            .mapValues { transactions in
                transactions.reduce(0) { $0 + $1.amount }
            }
    }
    

    static func categoryPercentages(
        from transactions: [Transaction]
    ) -> [TransactionCategory: Double] {

        let expensesByCategory = expensesByCategory(from: transactions)
        let totalExpenses = monthlyExpenses(from: transactions)

        return TransactionCategory.allCases.reduce(into: [:]) {
            result,
            category in

            let amount = expensesByCategory[category] ?? 0

            let percentage =
                totalExpenses > 0
                ? NSDecimalNumber(
                    decimal: amount / totalExpenses
                ).doubleValue
                : 0

            result[category] = percentage
        }
    }
}
