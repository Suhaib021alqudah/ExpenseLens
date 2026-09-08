//
//  PrimaryButton.swift
//  ExpenseLens
//
//  Created by Trainee on 05/09/2026.
//

import SwiftUI

struct PrimaryButton: View {

    var body: some View {

        Button {
            print("Transaction Added")
        } label: {
            HStack(spacing: 20) {
                Image(systemName: "plus")
                    .font(.system(size: 14, weight: .bold))
                Text("Add Transaction")
                    .font(AppTypography.buttonTitle)
                    .foregroundStyle(.white)

            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(
                LinearGradient.primaryButton
            )

        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        .shadow(color: .success.opacity(0.25), radius: 14, x: 0, y: 4)

    }
}

#Preview {
    PrimaryButton()
}
