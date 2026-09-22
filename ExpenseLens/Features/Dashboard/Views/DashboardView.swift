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
    init() {
        _viewModel = State(initialValue: DashboardViewModel(
            repository: AppDependencies.shared.financeRepository as! FakeFinanceRepository
        ))
    }
    
    
    
    
    
//MARK: - Body

    var body: some View {
        
        //MARK: Local Binding
        
        /*
         Local bindable lets us create bindings like $viewModel.selectedDate.

         @State keeps ownership of the DashboardViewModel inside the View.

         @Bindable does NOT create another ViewModel.
         It wraps the same observable object so we can create two-way bindings
         to its properties, such as selectedDate.
         
         viewModel.selectedDate
         // value

         $viewModel.selectedDate
         // binding to that value
         
        */
        
        @Bindable var viewModel = viewModel

        NavigationStack {
            ZStack(alignment: .bottomTrailing) {

                Color(.backgroundPrimary).ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {

                        headeSection
                        monthlyTrackerSection
                        categoriesSection
                        recentTransactionsSection

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
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
    private var headeSection: some View {
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
            MonthSwitcherView(selectedDate: $viewModel.selectedDate)
            monthlyBudgetSection

        }
    }
}

//MARK: - MonthlyBudget

extension DashboardView {
    private var monthlyBudgetSection: some View {
        HStack(spacing: 16) {
            CircularProgress(progress: viewModel.budgetProgress)
            VStack(alignment: .leading) {
                Text(.monthlyBudget)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(.textSecondary)
                Text(viewModel.monthlyExpenses, format: .currency(code: "USD"))
                    .font(AppTypography.cardAmountValue)
                    .padding(
                        .top,
                        10
                    )
                Text(.of$Budget(NSDecimalNumber(decimal: viewModel.monthlyBudget).intValue))
                
                BudgetProgressBar(progress: viewModel.budgetProgress)
                    .frame(width: 152)
                Text(
                    .remaining(
                        viewModel.remainingBudget.formatted(
                            .currency(code: "USD")
                        )
                    )
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
               
                    
            }.padding(.top, 32)
            CategoriesRow(

                categoryProgressList:
                    viewModel.categoryProgressList
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
                
            }.padding(.vertical, 10)

            List {
                ForEach(viewModel.filteredTransactions) { transaction in
                    TransactionRow(transaction: transaction)
                        .listRowBackground(Color(.whiteBackground))
                }

            }
            .scrollDisabled(true)
            .scrollIndicators(.hidden)
            .frame(height: 392)
            .listStyle(.plain)
            .clipShape(RoundedRectangle(cornerRadius: 20))
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
