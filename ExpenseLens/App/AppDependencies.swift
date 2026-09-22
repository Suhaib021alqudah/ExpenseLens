//
//  AppDependencies.swift
//  ExpenseLens
//
//  Created by Trainee on 05/09/2026.
//

import Foundation

@MainActor

final class AppDependencies {
    
    static let shared = AppDependencies()
    let financeRepository : FinanceRepository
    
    private init() {
        self.financeRepository = FakeFinanceRepository()
    }
    
}
