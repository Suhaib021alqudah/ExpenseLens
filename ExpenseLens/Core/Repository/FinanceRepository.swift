//
//  FinanceRepository.swift
//  ExpenseLens
//
//  Created by Trainee on 08/09/2026.
//

import Foundation

protocol FinanceRepository {
    
    func fetchTransactions() throws -> [Transaction]
    func addTransaction(_ transaction: Transaction) throws
    func updateTransaction(_ transaction: Transaction) throws
    func deleteTransaction(_ transaction: Transaction) throws
}
