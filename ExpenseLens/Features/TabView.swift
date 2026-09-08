//
//  TabView.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        SwiftUI.TabView {
            Tab(.home, systemImage: "house") {
                DashboardView()
            }
            Tab(.reports, systemImage: "chart.bar") {
                ReportsView()
            }
            Tab(.budget, systemImage: "creditcard") {
                BudgetView()
            }
            Tab(.more, systemImage: "ellipsis") {
            }
        }
    }
}

#Preview {
    TabView()
}
