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

    init(repository: FakeFinanceRepository) {
        self.repository = repository
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
