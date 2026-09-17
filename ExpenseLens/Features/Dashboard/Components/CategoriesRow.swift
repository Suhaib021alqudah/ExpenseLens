//
//  CategoriesRow.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct CategoriesRow: View {
    let categoryProgressList: [CategoryProgress]
    @State private var selectedCategory: TransactionCategory?

    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHStack(spacing: 12) {
                    ForEach(categoryProgressList) { item in
                        CategoryCard(
                            item: item,
                            isSelected: selectedCategory == item.transactionCategory
                        )
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                selectedCategory = item.transactionCategory
                            }
                        }
                    }
                }

                .padding(.horizontal)
            }
            .frame(height: 100)
        }
    }
}

extension CategoryProgress {
    static let mockData: [CategoryProgress] = [
        CategoryProgress(
            transactionCategory:.shopping,
            category: AppCategories.shopping,
            percentage: 1.13,
            percentageColor: .red
        ),
        CategoryProgress(
       

            transactionCategory:.food,
            category: AppCategories.food,
            percentage: 0.73,
            percentageColor: .teal600
        ),
        CategoryProgress(
            transactionCategory:.transport,
            category: AppCategories.transport,
            percentage: 0.63,
            percentageColor: .teal600
        ),
        CategoryProgress(
            transactionCategory: .bills,
            category: AppCategories.bills,
            percentage: 0.73,
            percentageColor: .teal600
        ),
        CategoryProgress(
            transactionCategory: .health,
            category: AppCategories.health,
            percentage: 0.60,
            percentageColor: .teal600
        ),
    ]
}

enum AppCategories {
    static let shopping = CategoryItem(
        iconName: "bag",
        title: .shopping,
        titleColor: .pinkForeground,
        iconBackgroundColor: .pinkBackground,
        foregroundColor: .pinkForeground

    )

    static let food = CategoryItem(
        iconName: "fork.knife",
        title: .food,
        titleColor: .yellowForeground,
        iconBackgroundColor: .yellowBackground,
        foregroundColor: .yellowForeground

    )

    static let transport = CategoryItem(
        iconName: "briefcase",
        title: .transport,
        titleColor: .purpleForeground,
        iconBackgroundColor: .purpleBackground,
        foregroundColor: .purpleForeground
    )

    static let bills = CategoryItem(
        iconName: "bolt",
        title: .bills,
        titleColor: .navyForeground,
        iconBackgroundColor: .navyBackround,
        foregroundColor: .navyForeground
    )

    static let health = CategoryItem(
        iconName: "heart",
        title: .health,
        titleColor: .redForeground,
        iconBackgroundColor: .redBackground,
        foregroundColor: .redForeground

    )


  
}
