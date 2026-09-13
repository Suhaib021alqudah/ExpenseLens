//
//  MonthlySwitcher.swift
//  ExpenseLens
//
//  Created by Trainee on 09/09/2026.
//

import SwiftUI

struct MonthSwitcherView: View {
    @Binding var selectedDate: Date

    var body: some View {

        HStack {
            Button {
                changeMonth(by: -1)
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.teal700)
            }
            .frame(width: 44, height: 44)

            Text(formattedMonth)
                .font(AppTypography.buttonTitle)
                .foregroundStyle(.primary)

            Button {
                changeMonth(by: 1)

            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.teal700)
            }
            
            .frame(width: 44, height: 44)
            
        }
        .environment(\.layoutDirection, .leftToRight)
        .padding(.horizontal, 28)
        .frame(maxWidth: .infinity)
        .frame(height: 80)

    }

    private var formattedMonth: String {
        selectedDate.formatted(
            Date.FormatStyle()
                .month(.abbreviated)
                .year()
        )
    }

    private func changeMonth(by value: Int) {
        if let newDate = Calendar.current.date(
            byAdding: .month,
            value: value,
            to: selectedDate
        ) {
            selectedDate = newDate
        }
    }
}
