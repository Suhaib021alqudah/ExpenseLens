//
//  ReportsView.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct ReportsView: View {
    @State private var viewModel: ReportsViewModel
    @State private var selection = 0

    init() {
        _viewModel = State(
            initialValue: ReportsViewModel(repository: FakeFinanceRepository())
        )
    }

    var body: some View {

        ZStack {
            Color(.backgroundPrimary).ignoresSafeArea()
            VStack {

                headeSection
                segmant
                Divider()
                if selection == 0 {
                                CategoryView(
                                    transactions: viewModel.filteredTransactions
                                )
                            } else {
                                MonthlyView(
                                    transactions: viewModel.filteredTransactions
                                )
                            }
                Spacer()

            }.padding(.horizontal, 20)

        }
    }
}

#Preview {
    ReportsView()
}

extension ReportsView {
    private var headeSection: some View {
        VStack(alignment: .leading) {
            Text(.reports)
                .font(AppTypography.caption)
                .foregroundStyle(.textSecondary)
            HStack {
                Text(.spending)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 2)
                Spacer()
                MonthSwitcherView(selectedDate: $viewModel.selectedDate)
            }.frame(maxWidth: .infinity)

        }
    }
}

extension ReportsView {

    private var segmant: some View {

        HStack(spacing: 0) {

            Button {
                selection = 0
            } label: {
                Text("Category")
                    .font(AppTypography.buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        selection == 0
                            ? Color.segmantForeground
                            : Color.segmantBackground
                    )
            }
            .buttonStyle(.plain)

            Button {
                selection = 1
            } label: {
                Text("Monthly")
                    .font(AppTypography.buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        selection == 1
                            ? Color.segmantForeground
                            : Color.segmantBackground
                    )
            }
            .buttonStyle(.plain)
        }
        .background(Color.segmantBackground)
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
    }
}
