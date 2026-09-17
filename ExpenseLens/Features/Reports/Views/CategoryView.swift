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
    @State private var transaction: Bool = false
    @State private var isSelected: Bool = false

    //MARK: - Body

    var body: some View {
        ScrollView {
            VStack {

                spendingChart
                CategoriesRow
                CategoryExpenseColumn
                Spacer()
            }
            .onDisappear {
                resetSelection()
            }
        }
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
            $0.category.id == selectedCategory.categoryItem.id
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
                    )
                    Text(selectedCategoryAmount, format: .currency(code: "USD"))
                        .foregroundStyle(selectedCategory.iconColor)
                    Text(
                        selectedCategoryPercentage,
                        format: .percent.precision(.fractionLength(0))
                    ).foregroundStyle(selectedCategory.iconColor)
                }

            } else {
                VStack {
                    Text(totalAmount, format: .currency(code: "USD"))
                    Text(.total)
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

        VStack(alignment: .leading, spacing: 10) {

            HStack(spacing: 70) {
                Button {
                    selectedCategory = .shopping
                } label: {
                    Text(.shopping)
                }.font(AppTypography.buttonTitle)
                    .foregroundStyle(
                        selectedCategory == .shopping
                            ? .pinkForeground : .greyForeground
                    )

                Button {
                    selectedCategory = .food
                } label: {
                    Text(.food)
                }.font(AppTypography.buttonTitle)
                    .foregroundStyle(
                        selectedCategory == .food
                            ? .yellowForeground : .greyForeground
                    )

                Button {
                    selectedCategory = .transport
                } label: {
                    Text(.transport)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .transport
                        ? .purpleForeground : .greyForeground
                )
            }

            HStack(spacing: 70) {
                Button {
                    selectedCategory = .bills
                } label: {
                    Text(.bills)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .bills
                        ? .navyForeground : .greyForeground
                )

                Button {
                    selectedCategory = .health
                } label: {
                    Text(.health)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .health
                        ? .redForeground : .greyForeground
                )

                Button {
                    selectedCategory = .entertainment
                } label: {
                    Text(.entertainment)
                }.font(AppTypography.buttonTitle)
                    .foregroundStyle(
                        selectedCategory == .entertainment
                            ? .entertainment : .greyForeground
                    )
            }

            HStack(spacing: 70) {
                Button {
                    selectedCategory = .house
                } label: {
                    Text(.house)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .house ? .teal700 : .greyForeground
                )

                Button {
                    selectedCategory = .education
                } label: {
                    Text(.education)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .education ? .teal300 : .greyForeground
                )

                Button {
                    selectedCategory = .travel
                } label: {
                    Text(.travel)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .travel ? .orange : .greyForeground
                )

            }

            HStack(spacing: 70) {
                Button {
                    selectedCategory = .subscriptions
                } label: {
                    Text(.subscriptions)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .subscriptions
                        ? .purpleForeground : .greyForeground
                )

                Button {
                    selectedCategory = .personalCare
                } label: {
                    Text(.personalcare)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .personalCare
                        ? .pinkForeground : .greyForeground
                )

                Button {
                    selectedCategory = .other
                } label: {
                    Text(.other)
                }.font(AppTypography.buttonTitle).foregroundStyle(
                    selectedCategory == .other ? .gray : .greyForeground
                )

            }
        }

    }
}

//MARK: - Category Expense Column
extension CategoryView {
    private var CategoryExpenseColumn: some View {
        VStack{
            ForEach(chartData, id: \.category) { item in
                CategorySpendingRow(
                    category: item.category,
                    amount: item.amount,
                    percentage: percentage(for: item.category)
                )
            } }.background(RoundedRectangle(cornerRadius: 16).fill(Color(.whiteBackground)))
        
        
    }
    
    //MARK: - Preview
    //    #Preview {
    //        CategoryView(
    //            chartData: [
    //                (.shopping, 340),
    //                (.food, 220),
    //                (.transport, 95),
    //                (.bills, 80),
    //                (.health, 60),
    //                (.entertainment, 45),
    //                (.house, 850),
    //                (.education, 30),
    //                (.travel, 20),
    //                (.subscriptions, 15),
    //                (.personalCare, 10),
    //                (.other, 5),
    //            ],
    //            totalAmount: 1770,
    //            categoryProgressList: [
    //                CategoryProgress(
    //                    category: .init(
    //
    //                        iconName: "bag",
    //                        title: .shopping,
    //                        titleColor: .pinkForeground,
    //                        iconBackgroundColor: .pinkBackground,
    //                        foregroundColor: .pinkForeground
    //                    ),
    //                    percentage: 0.19,
    //                    percentageColor: .pinkForeground
    //                ),
    //                CategoryProgress(
    //                    category: .init(
    //                        iconName: "fork.knife",
    //                        title: .food,
    //                        titleColor: .yellowForeground,
    //                        iconBackgroundColor: .yellowBackground,
    //                        foregroundColor: .yellowForeground
    //                    ),
    //                    percentage: 0.12,
    //                    percentageColor: .yellowForeground
    //                ),
    //            ]
    //        )
    //    }
    //}
}
