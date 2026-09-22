//
//  TransactionHistoryViewModel.swift
//  ExpenseLens
//
//  Created by Trainee on 22/09/2026.
//


import Foundation
import Observation

@MainActor
@Observable
final class TransactionHistoryViewModel {
    private let repository: FinanceRepository

    private(set) var transactions: [Transaction] = []

    var selectedCategory: TransactionCategory? = nil
    var searchText: String = ""

    init(repository: FinanceRepository) {
        self.repository = repository
    }

    func loadTransactions() {
        do {
            transactions = try repository.fetchTransactions()
        } catch {
            print("Failed to load: \(error)")
        }
    }

    var filteredTransactions: [Transaction] {
        transactions.filter { item in
            let matchesCategory = selectedCategory == nil || item.category == selectedCategory
            let matchesSearch = searchText.isEmpty || item.title.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }
}
