//
//  DashboardViewModel.swift
//  ExpenseLens
//
//  Created by Trainee on 08/09/2026.
//

import Foundation
import Observation

@MainActor
@Observable
final class DashboardViewModel {

    //MARK: - Properties

    private let repository: FinanceRepository
    private(set) var transactions: [Transaction] = []
    private(set) var state: DashboardViewState = .idle
    var selectedDate = Date()

    init(repository: FakeFinanceRepository) {
        self.repository = repository
    }

    var filteredTransactions: [Transaction] {
        transactions.filter { transaction in
            Calendar.current.isDate(
                transaction.date,
                equalTo: selectedDate,
                toGranularity: .month
            )
        }
    }

    //MARK: - Budget Properties

    var monthlyBudget: Decimal = 1050

    var remainingBudget: Decimal {
        monthlyBudget - monthlyExpenses
    }

    var budgetProgress: Double {
        guard monthlyBudget > 0 else { return 0 }

        let expenses = NSDecimalNumber(decimal: monthlyExpenses).doubleValue
        let budget = NSDecimalNumber(decimal: monthlyBudget).doubleValue

        return expenses / budget
    }

    //MARK: - Expense Properties

    var monthlyExpenses: Decimal {
        filteredTransactions
            .filter { $0.type == .expense }
            .reduce(0) { $0 + $1.amount }
    }
    var expenses: [Transaction] {
        filteredTransactions.filter {
            $0.type == .expense
        }
    }

    var expensesByCategory: [TransactionCategory: Decimal] {
        Dictionary(grouping: expenses, by: \.category)
            .mapValues { transactions in
                transactions.reduce(0) { $0 + $1.amount }
            }
    }

   
    
    var categoryProgressList: [CategoryProgress] {
        TransactionCategory.allCases.map { category in

            let amount = expensesByCategory[category] ?? 0

            let percentage =
                monthlyExpenses > 0
                ? NSDecimalNumber(
                    decimal: amount / monthlyExpenses
                ).doubleValue
                : 0

            return CategoryProgress(
                category: category.categoryItem,
                percentage: percentage,
                percentageColor: category.iconColor
            )
        }
    }

    //MARK: - Load Transactions Function
    func loadTransactions() {
        state = .loading
        do {
            transactions = try repository.fetchTransactions()
            state = transactions.isEmpty ? .empty : .loaded
        } catch {
            state = .error(error.localizedDescription)
        }
    }

}

//MARK: - Dashboard State Enum

enum DashboardViewState {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
}
