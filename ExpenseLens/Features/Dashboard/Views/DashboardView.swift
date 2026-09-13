//
//  DashboardView.swift
//  ExpenseLens
//
//  Created by Trainee on 05/09/2026.
//

import SwiftUI

struct DashboardView: View {

    //MARK: - Properties

    @State private var viewModel: DashboardViewModel
    init()
    {_viewModel = State(initialValue: DashboardViewModel(repository: FakeFinanceRepository()))}
    
    let progress: Double = 0.9
    let amount: Int = 856
    let budget: Double = 1050
    let avilableAmount: Double = 200.5
    @State private var selectedDate = Date()
    
    
    
//MARK: - Body

    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {

                Color(.backgroundPrimary).ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {

                        header
                        monthlyTrackerSection
                        categoriesSection
                        recentTransactionsSection

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)

                }
                .task {viewModel.loadTransactions()}
                .scrollIndicators(.hidden)

                addTransactionButton

            }

        }

    }
}

//MARK: Preview

#Preview {
    DashboardView()
}

//MARK: - Header
extension DashboardView {
    private var header: some View {
        VStack(alignment: .leading) {
            Text(.goodMorning)
                .font(AppTypography.caption)
                .foregroundStyle(.textSecondary)
            HStack {
                Text("Suhaib")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 2)

                Spacer()

                Button {
                    print("Notification Tapped!")
                } label: {
                    Image(systemName: "bell")
                        .foregroundStyle(.textSecondary)
                }.buttonStyle(.plain)

                Button {
                    print("Profile Picture Tapped!")
                } label: {
                    ZStack {
                        Text("S").foregroundStyle(.white)
                    }
                }
                .frame(width: 36, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(
                        LinearGradient.appIcon
                    )
                )

            }

        }
    }
}
//MARK: - MonthlyTracker {

extension DashboardView {
    private var monthlyTrackerSection: some View {
        VStack {
            MonthSwitcherView(selectedDate: $selectedDate)
            monthlyBudgetSection

        }
    }
}

//MARK: - MonthlyBudget

extension DashboardView {
    private var monthlyBudgetSection: some View {
        HStack(spacing: 16) {
            CircularProgress(progress: progress)
            VStack(alignment: .leading) {
                Text(.monthlyBudget)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(.textSecondary)
                Text(amount, format: .currency(code: "USD"))
                    .font(AppTypography.cardAmountValue)
                    .padding(
                        .top,
                        10
                    )
                Text(.of$Budget(amount))
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(.textSecondary).padding(
                        .top,
                        2
                    )
                BudgetProgressBar(progress: progress)
                    .frame(width: 152)
                Text(
                    .remaining("$\(avilableAmount)")
                )
                .font(AppTypography.caption)
                .foregroundStyle(.teal600).padding(.top, 2)
                Spacer()
            }.padding(.top, 28)

        }.frame(maxWidth: .infinity).frame(height: 180)
            .background(
                RoundedRectangle(cornerRadius: 22).fill(
                    .whiteBackground
                )
            )
    }
}

//MARK: - Categories Section
extension DashboardView {
    private var categoriesSection: some View {
        VStack {
            HStack {
                Text(.categories)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(.textSecondary)
                Spacer()
                NavigatorButton(
                    text: .seeAll,
                    destination: CategoryView()
                )
            }.padding(.top, 32)
            CategoriesRow(

                categoryProgressList:
                    CategoryProgress.mockData

            )
        }
    }
}

//MARK: - Transaction Section
extension DashboardView {
    private var recentTransactionsSection: some View {
        VStack {
            HStack {
                Text(.recent)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(.textSecondary)
                Spacer()
                NavigatorButton(
                    text: .seeAll,
                    destination: CategoryView()
                )
            }.padding(.vertical, 10)

            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionRow(transaction: transaction)
                        .listRowBackground(Color(.whiteBackground))
                }

            }
            .scrollIndicators(.hidden)
            .frame(height: 392)
            .listStyle(.plain)
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
        }
    }
}

//MARK: - Add Transaction Button
extension DashboardView {

    private var addTransactionButton: some View {
        NavigationLink {
            AddTransactionView()
        } label: {
            Image(systemName: "plus")
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(.white)

        }
        .frame(width: 54, height: 54)
        .background(RoundedRectangle(cornerRadius: 50).fill(LinearGradient.appIcon))
        .buttonStyle(.plain)
        .padding()
    }
}
