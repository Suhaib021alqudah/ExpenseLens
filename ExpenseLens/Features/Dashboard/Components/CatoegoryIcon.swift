//
//  CatoegoryIcon.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct CatoegoryIcon: View {
    var body: some View {
        Image(systemName: "basket")
            .foregroundStyle(.pinkForeground)
            .frame(width: 34, height: 34)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pinkBackground)
            )
    }
}

#Preview {
    CatoegoryIcon()
}
