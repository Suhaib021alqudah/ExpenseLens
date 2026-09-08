//
//  File.swift
//  ExpenseLens
//
//  Created by Trainee on 07/09/2026.
//

import Foundation
protocol TransactionRepositoryProtocol {
    func fetchRecentTransactions(limit: Int) -> [Transaction]
    func fetchTransactions(for month: Date) -> [Transaction]
}
