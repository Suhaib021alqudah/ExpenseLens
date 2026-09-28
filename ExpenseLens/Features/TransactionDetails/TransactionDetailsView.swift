//
//  TransactionDetails.swift
//  ExpenseLens
//
//  Created by Trainee on 24/09/2026.
//

import SwiftUI

struct TransactionDetailsView: View {

    let transaction: Transaction

    //    private var formattedMonth: String {
    //        transaction.date.formatted(
    //            Date.FormatStyle()
    //                .month(.abbreviated)
    //                .year()
    //        )
    //    }
    //
    //
    var body: some View {

        ZStack {
            Color(.backgroundPrimary).ignoresSafeArea()
            VStack {
                transactionAmountSection
                transactionDeatilsSection.padding(.top, 10)
                Spacer()

            }.padding(.horizontal, 20)

        }.navigationTitle(.transactionDetails)
            .toolbar(.hidden, for: .tabBar)

    }
}

#Preview {
    TransactionDetailsView(
        transaction: Transaction(
            title: "Zara Online",
            amount:
                89.87,
            date: .now,
            type: .expense,
            category: .shopping,
            note: "Summer Sale haui"
        )
    )
}

//MARK: - Transaction Amount Section
extension TransactionDetailsView {

    private var transactionAmountSection: some View {
        VStack {
            HStack {
                Image(systemName: transaction.category.iconName)
                    .foregroundStyle(transaction.category.iconColor)
                    .font(
                        AppTypography.rowLabel
                    )
                Text(transaction.category.localizedTitle)
                    .foregroundStyle(
                        transaction.category.iconColor
                    ).font(AppTypography.rowLabel)
            }.padding(.horizontal).frame(width: 160, height: 40).background(
                Capsule().fill(transaction.category.iconColor).opacity(0.1)
            )

            Text(transaction.title).font(AppTypography.cardTitle)
                .padding(
                    .vertical
                )

            Text(
                transaction.type == .income
                    ? " +\(transaction.amount)$"
                    : " -\(transaction.amount)$"
            )
            .foregroundStyle(
                transaction.type == .income ? .teal700 : .redForeground
            )
            .font(AppTypography.displayAmount)

            HStack {
                HStack {
                    Image(
                        systemName: transaction.type == .expense
                            ? "arrow.down.right" : "arrow.up.right"
                    ).foregroundStyle(
                        transaction.type == .expense
                            ? .pinkForeground : .teal500
                    )
                    Text(transaction.type.rawValue).foregroundStyle(
                        transaction.type == .expense
                            ? .pinkForeground : .teal600
                    ).font(AppTypography.rowLabel)

                }.frame(width: 110, height: 40).background(
                    RoundedRectangle(cornerRadius: 16).fill(
                        transaction.type == .expense
                            ? .pinkForeground : .teal500
                    ).opacity(0.1)
                )

                Text(transaction.date.formatted()).font(
                    AppTypography.rowLabel
                ).foregroundStyle(.greyForeground)
            }

        }.frame(maxWidth: .infinity).padding(.vertical)
            .background(
                RoundedRectangle(cornerRadius: 18).fill(
                    .whiteBackground
                )
            )

    }
}

//MARK: - Transaction Deatils Section
extension TransactionDetailsView {

    private var transactionDeatilsSection: some View {
        VStack(alignment: .leading) {

            HStack {
                Image(systemName: transaction.category.iconName)
                    .foregroundStyle(transaction.category.iconColor)
                    .font(
                        AppTypography.rowLabel
                    ).frame(width: 46, height: 46).background(
                        RoundedRectangle(cornerRadius: 16).fill(
                            transaction.category.backgroundColor
                        )
                    )

                VStack(alignment: .leading, spacing: 6) {
                    Text("Category").font(.caption).foregroundStyle(
                        .textSecondary
                    )
                    Text(transaction.category.localizedTitle).font(
                        AppTypography.rowLabel
                    )
                }

            }

            Divider()

            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.navyForeground)
                    .font(
                        AppTypography.rowLabel
                    ).frame(width: 46, height: 46).background(
                        RoundedRectangle(cornerRadius: 16).fill(
                            .navyBackround
                        )
                    )

                VStack(alignment: .leading, spacing: 6) {
                    Text("Date").font(.caption).foregroundStyle(
                        .textSecondary
                    )
                    Text(transaction.date.formatted()).font(
                        AppTypography.rowLabel
                    )
                }

            }.padding(.top, 4)
            Divider()

            HStack {
                Image(systemName: "document")
                    .foregroundStyle(.yellowForeground)
                    .font(
                        AppTypography.rowLabel
                    ).frame(width: 46, height: 46).background(
                        RoundedRectangle(cornerRadius: 16).fill(
                            .yellowBackground
                        )
                    )

                VStack(alignment: .leading, spacing: 6) {
                    Text("Note").font(.caption).foregroundStyle(
                        .textSecondary
                    )
                    Text(transaction.note!).font(
                        AppTypography.rowLabel
                    )
                }

            }.padding(.top, 4)
        }.frame(maxWidth: .infinity).padding()
            .background(
                RoundedRectangle(cornerRadius: 18).fill(
                    .whiteBackground
                )
            )

    }
}
