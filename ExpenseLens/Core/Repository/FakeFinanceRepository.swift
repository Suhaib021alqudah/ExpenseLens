//
//  FakeFinanceRepository.swift
//  ExpenseLens
//
//  Created by Trainee on 09/09/2026.
//

import SwiftUI

final class FakeFinanceRepository: FinanceRepository {

    private var transactions: [Transaction] = [
        
        Transaction(
            title: "Starbucks",
            amount: 6.75,
            date: .now,
            type: .expense,
            category: .food,
            note: "Morning Coffee"
        ),

        Transaction(
            title: "Uber",
            amount: 14.30,
            date: .now,
            type: .expense,
            category: .transport,
            note: "Ride to work"
        ),

        Transaction(
            title: "Zara",
            amount: 89.99,
            date: .now,
            type: .expense,
            category: .shopping,
            note: "New clothes"
        ),

        Transaction(
            title: "Electricity Bill",
            amount: 48.20,
            date: .now,
            type: .expense,
            category: .bills,
            note: "Monthly electricity bill"
        ),

        Transaction(
            title: "Monthly Salary",
            amount: 950.00,
            date: .now,
            type: .income,
            category: .other,
            note: "September salary"
        ),

        Transaction(
            title: "Freelance Project",
            amount: 320.00,
            date: .now,
            type: .income,
            category: .other,
            note: "iOS freelance payment"
        ),

        Transaction(
            title: "Netflix",
            amount: 9.99,
            date: .now,
            type: .expense,
            category: .subscriptions,
            note: "Monthly subscription"
        ),

        Transaction(
            title: "Pharmacy",
            amount: 22.40,
            date: .now,
            type: .expense,
            category: .health,
            note: "Medicine"
        ),

        Transaction(
            title: "Apartment Rent",
            amount: 350.00,
            date: .now,
            type: .expense,
            category: .house,
            note: "Monthly rent"
        ),

        Transaction(
            title: "Online Course",
            amount: 45.00,
            date: .now,
            type: .expense,
            category: .education,
            note: "SwiftUI course"
        )
      ,
        
        Transaction(
            title: "Apartment Rent",
            amount: 350.00,
            date: .now,
            type: .expense,
            category: .house,
            note: "Monthly rent"
        ),

        Transaction(
            title: "Online Course",
            amount: 45.00,
            date: .now,
            type: .expense,
            category: .education,
            note: "SwiftUI course"
        )
        
        ]
        
       
        
    

    func fetchTransactions() throws -> [Transaction] {
        transactions
    }

    func addTransaction(_ transaction: Transaction) throws {
        transactions.append(transaction)
    }

    func updateTransaction(_ transaction: Transaction) throws {
        // later
    }

    func deleteTransaction(_ transaction: Transaction) throws {
        // later
    }
}
