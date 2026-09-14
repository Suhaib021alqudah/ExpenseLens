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
    
    //MARK: - Recent Transactions
    var recentTransactions: [Transaction] {
        Array(
            filteredTransactions
                .sorted { $0.date > $1.date }
                .prefix(3)
        )
    }
   
}
