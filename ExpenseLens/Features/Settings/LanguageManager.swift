////
////  LocalizationManager.swift
////  ExpenseLens
////
////  Created by Trainee on 24/09/2026.
////
//
//import Foundation
//import Observation
//import SwiftUI
//
//@Observable
//
//class LanguageManager {
//
//    static let shared = LanguageManager()
//
//    @AppStorage("currentLanguage")
//    private var storedLanguage: Language = .english
//   @State var currentLanguage: Language = .english {
//        didSet {
//            storedLanguage = currentLanguage
//            Bundle.setLanguage(language: currentLanguage.rawValue )
//        }
//    }
//
//}
