//
//  CategoryView.swift
//  ExpenseLens
//
//  Created by Trainee on 14/09/2026.
//

import Charts
import SwiftUI

struct CategoryView: View {

    //MARK: - Properties

    let chartData: [(category: TransactionCategory, amount: Decimal)]
    let totalAmount: Decimal
    let categoryProgressList: [CategoryProgress]

    @State private var selected: Double?
    @State private var selectedCategory: TransactionCategory? = nil

    //MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading){

                spendingChart
                CategoriesRow
                CategoryExpenseColumn
                Spacer()
            }
            .onDisappear {
                resetSelection()
            }
        }.scrollIndicators(.hidden)

    }

    //MARK: - Functions

    private func getSelectedCategory(from value: Double?) {
        guard let value else {
            selectedCategory = nil
            return
        }

        var total: Double = 0

        for item in chartData {
            total += NSDecimalNumber(decimal: item.amount).doubleValue

            if value <= total {
                if selectedCategory == item.category {
                    selectedCategory = nil
                    selected = nil
                } else {
                    selectedCategory = item.category
                }
                return
            }
        }
    }

    private func percentage(
        for category: TransactionCategory
    ) -> Double {
        categoryProgressList.first {
            $0.transactionCategory == category
        }?.percentage ?? 0
    }

    //MARK: - Computed Properties
    private var selectedCategoryAmount: Decimal {
        guard let selectedCategory else { return 0 }

        return chartData.first {
            $0.category == selectedCategory
        }?.amount ?? 0
    }

    private var selectedCategoryName: LocalizedStringResource {
        selectedCategory?.localizedTitle ?? .total
    }

    private var selectedCategoryPercentage: Double {
        guard let selectedCategory else { return 0 }

        return categoryProgressList.first {
            $0.transactionCategory == selectedCategory
        }?.percentage ?? 0
    }

    private func resetSelection() {
        selected = nil
        selectedCategory = nil
    }

}

//MARK: - SpendingChart
extension CategoryView {

    private var spendingChart: some View {
        Chart(chartData, id: \.category) { item in
            SectorMark(
                angle: .value(
                    "Amount",
                    NSDecimalNumber(decimal: item.amount).doubleValue
                ),
                innerRadius: .ratio(0.65),
                outerRadius: selectedCategory == item.category
                    ? .ratio(1.0) : .ratio(0.85),
                angularInset: 2
            )

            .cornerRadius(6)
            .foregroundStyle(item.category.iconColor)
        }
        .aspectRatio(1, contentMode: .fit)
        .chartAngleSelection(value: $selected)
        .chartBackground(content: { _ in
            if let selectedCategory {
                VStack {
                    Text(selectedCategoryName).foregroundStyle(
                        selectedCategory.iconColor
                    ).font(AppTypography.cardTitle)
                    Text(selectedCategoryAmount, format: .currency(code: "USD"))
                        .font(AppTypography.cardTitle)
                        .foregroundStyle(selectedCategory.iconColor)
                    Text(
                        selectedCategoryPercentage,
                        format: .percent.precision(.fractionLength(0))
                    ).foregroundStyle(selectedCategory.iconColor)
                        .font(AppTypography.cardTitle)
                }

            } else {
                VStack {
                    Text(totalAmount, format: .currency(code: "USD")).font(
                        AppTypography.cardTitle
                    )
                    Text(.total).font(AppTypography.cardTitle)
                }
            }
        })
        .onChange(of: selected) { oldValue, newValue in
            if let newValue {
                withAnimation(.snappy(duration: 0.2)) {
                    getSelectedCategory(from: newValue)
                }
            }
        }
        //        .frame(width: 330,height: 300)
        //
    }
}
//MARK: - Caregories Row

extension CategoryView {

    private var CategoriesRow: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
            ],
            spacing: 16
        ) {
            ForEach(TransactionCategory.allCases, id: \.self) { category in
                Button {
                    selectedCategory =
                        (selectedCategory == category) ? nil : category
                } label: {
                    Text(category.localizedTitle)
                        .font(AppTypography.buttonTitle)
                        .foregroundStyle(
                            selectedCategory == category
                                ? category.iconColor
                                : .greyForeground
                        )
                }
            }
        }
    }

}

//MARK: - Category Expense Column
extension CategoryView {
    private var CategoryExpenseColumn: some View {
        VStack(alignment: .leading) {
            Text(.categories).padding(.vertical,12)
        .font(AppTypography.sectionLabel)
        .foregroundStyle(.textSecondary)
        VStack{
            
            ForEach(chartData, id: \.category) { category in
                
                CategorySpendingRow(
                    category: category.category,
                    amount: category.amount,
                    percentage: percentage(for: category.category)
                )
            }
        }.background(RoundedRectangle(cornerRadius: 12).fill(.whiteBackground))
        
        

    }

        }


}
