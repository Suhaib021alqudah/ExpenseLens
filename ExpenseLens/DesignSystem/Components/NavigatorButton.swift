//
//  TextButton.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct NavigatorButton<Destination: View>: View {
    let text: LocalizedStringResource
    let destination: Destination  

    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .font(AppTypography.sectionLabel)
                .foregroundStyle(.teal700)
        }
    }
}

#Preview {
    NavigationStack {
        NavigatorButton(text: "See All", destination: Text("All Transactions View"))
    }
}
