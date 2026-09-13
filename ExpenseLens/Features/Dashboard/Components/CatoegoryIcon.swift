//
//  CatoegoryIcon.swift
//  ExpenseLens
//
//  Created by Trainee on 06/09/2026.
//

import SwiftUI

struct CatoegoryIcon: View  {
    
    let transaction : Transaction
    
   
    var body: some View {
        Image(systemName: transaction.category.iconName)
            .foregroundStyle(transaction.category.iconColor)
            .frame(width: 42, height: 42)
            .background(RoundedRectangle(cornerRadius: 10).fill(transaction.category.backgroundColor))
    }
}

