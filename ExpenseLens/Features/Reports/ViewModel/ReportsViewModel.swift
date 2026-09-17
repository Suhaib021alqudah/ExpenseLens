//
//  ReportsViewModel.swift
//  ExpenseLens
//
//  Created by Trainee on 13/09/2026.
//

import SwiftUI
import Observation

@MainActor
@Observable

class ReportsViewModel {
    

    //MARK: - Properties
    private let repository: FinanceRepository
    private(set) var transactions: [Transaction] = []

    var selectedDate: Date = .now

    init(repository: FinanceRepository) {
        self.repository = repository
    }

    //MARK: - Load Transactions
    func loadTransactions() {
        do {
            transactions = try repository.fetchTransactions()
        } catch {
            print(error)
        }
    }
    
    var filteredTransactions: [Transaction] {
        TransactionAnalytics.transactions(
            from: transactions,
            for: selectedDate
        )
    }
    var expensesByCategory: [TransactionCategory: Decimal] {
        TransactionAnalytics.expensesByCategory(
            from: filteredTransactions
        )
    }
    
    var chartData: [(category: TransactionCategory, amount: Decimal)] {
        TransactionCategory.allCases.map { category in
            (
                category: category,
                amount: expensesByCategory[category] ?? 0
            )
        }
    }
    
    //MARK: - Recent Transactions
    var recentTransactions: [Transaction] {
        Array(
            filteredTransactions
                .sorted { $0.date > $1.date }
                .prefix(3)
        )
    }
   
    var monthlyExpenses: Decimal {
        TransactionAnalytics.monthlyExpenses(
            from: filteredTransactions
        )
        
    }
    
    
    var categoryProgressList: [CategoryProgress] {
        let percentages = TransactionAnalytics.categoryPercentages(
            from: filteredTransactions
        )

        return TransactionCategory.allCases.map { category in
            CategoryProgress(
                transactionCategory: category,
                category: category.categoryItem,
                percentage: percentages[category] ?? 0,
                percentageColor: category.iconColor
            )
        }
    }
}
