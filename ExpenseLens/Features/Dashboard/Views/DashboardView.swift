//
//  DashboardView.swift
//  ExpenseLens
//
//  Created by Trainee on 05/09/2026.
//

import SwiftUI

struct DashboardView: View {
    let progress: Double = 0.5
    let amount: Int = 856
    let budget: Double = 1050
    let avilableAmount: Double = 200.5
    var body: some View {
        NavigationStack {
            ZStack {

                //MARK: - Heading
                Color(.backgroundPrimary).ignoresSafeArea()
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
                            RoundedRectangle(cornerRadius: 12).fill().fill(
                                LinearGradient.appIcon
                            )
                        )

                    }
                    //MARK: - Month Switcher
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.teal700)
                        }
                        .frame(width: 44, height: 44)

                        Text("Aug 2026")
                            .font(AppTypography.buttonTitle)
                            .foregroundStyle(.primary)

                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.teal700)
                        }
                        .frame(width: 44, height: 44)
                    }.environment(\.layoutDirection, .leftToRight)
                        .padding(.horizontal, 28)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                    //MARK: - Monthly Tracker
                    HStack(spacing: 16) {
                        CircularProgress(progress: 0.5)
                        VStack(alignment: .leading) {
                            Text(.monthlyBudget)
                                .font(AppTypography.sectionLabel)
                                .foregroundStyle(.textSecondary)
                            Text(amount, format: .currency(code: "USD"))
                                .font(AppTypography.cardAmountValue).padding(
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

                    }.frame(maxWidth: .infinity).frame(height: 180).background(
                        RoundedRectangle(cornerRadius: 22).fill(.white)
                    )

                    //MARK: - Categories
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

                    //MARK: - Recnt
                    HStack {
                        Text(.recent)
                            .font(AppTypography.sectionLabel)
                            .foregroundStyle(.textSecondary)
                        Spacer()
                        NavigatorButton(
                            text: .seeAll,
                            destination: CategoryView()
                        )
                    }.padding(.top, 32)

                    //                    List {
                    //                        ForEach(transactions) { transaction in
                    //                            TransactionRow(transaction: transaction)
                    //                        }
                    //                    }
                    //                    .listStyle(.plain)
                    //                    .clipShape(
                    //                        RoundedRectangle(cornerRadius: 20)
                    //                    )

                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    DashboardView()
}
