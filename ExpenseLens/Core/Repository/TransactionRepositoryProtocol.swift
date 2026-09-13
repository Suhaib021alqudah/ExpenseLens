//
//  File.swift
//  ExpenseLens
//
//  Created by Trainee on 07/09/2026.
//

import Foundation

protocol CategoryRepositoryProtocol {
    
    func fetchAllCategories() -> [CategoryItem]
    func updateBudget(for category: CategoryItem, newBudget: Double)
    func fetchTotalBudget() -> Double
    func fetchAutoCalculateEnabled() -> Bool
    func setAutoCalculateEnabled(_ enabled: Bool)
    
}
