//
//  TransactionHistoryView.swift
//  ExpenseLens
//
//  Created by Trainee on 22/09/2026.
//


import SwiftUI

struct TransactionHistoryView: View {
    @State private var viewModel: TransactionHistoryViewModel

    init() {
        _viewModel = State(initialValue: TransactionHistoryViewModel(
            repository: AppDependencies.shared.financeRepository
        ))
    }

    var body: some View {
        NavigationStack {
            List(viewModel.filteredTransactions) { transaction in
                TransactionRow(transaction: transaction)
            }
            .navigationTitle("History")
            .searchable(text: $viewModel.searchText)
            .task {
                viewModel.loadTransactions()
            }
        }
    }
}
