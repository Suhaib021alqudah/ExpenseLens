//
//  Language.swift
//  ExpenseLens
//
//  Created by Trainee on 24/09/2026.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    var id: Self {
        self
    }

    case english = "en"
    case arabic = "ar"
}
