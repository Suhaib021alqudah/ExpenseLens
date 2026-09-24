
# ExpenseLens (On Progress)💰

> A smart, offline-first expense tracker built with SwiftUI — designed to make budgeting effortless, not tedious.

![Platform](https://img.shields.io/badge/platform-iOS%2017%2B-blue)
![Swift](https://img.shields.io/badge/swift-5.9-orange)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-purple)
![Localization](https://img.shields.io/badge/localization-EN%20%7C%20AR-green)
![Theme](https://img.shields.io/badge/theme-Light%20%7C%20Dark-lightgrey)

## 📱 Screenshots

| Home Light| Home Dark (AR) | 
|---|---|
|  <img src="ExpenseLens/Resources/App Screenshots/HomeLightEn.png" width="400"> | <img src="ExpenseLens/Resources/App Screenshots/HomeDarkAr.png" width="400">  | 

| **Category View**| **Category Dark (AR)**| 
|---|---|
|  <img src="ExpenseLens/Resources/App Screenshots/CategoryViewLigh.png" width="400"> | <img src="ExpenseLens/Resources/App Screenshots/CategoryDarkAR.png" width="400">  | 

| **Monthly View**| **Monthly Dark (AR)**| 
|---|---|
|  <img src="" width="400"> | <img src="">  | 

| **Budget View**| **Budegt Dark (AR)**| 
|---|---|
|  <img src="" width="400"> | <img src="">  | 

| **Settings View**| **Settings Dark (AR)**| 
|---|---|
|  <img src="ExpenseLens/Resources/App Screenshots/SettingsViewLight.png" width="400"> |  <img src="ExpenseLens/Resources/App Screenshots/SettingsDarkAR.png" width="400"> | 


## ✨ Features

- 📊 Real-time budget tracking with visual progress indicators
- 🗂 Category-based expense organization
- 📈 Monthly spending reports and trend comparison
- 🌗 Full Light/Dark mode support
- 🌍 Fully localized in **English & Arabic**, with complete RTL layout support
- 💾 Offline-first — all data stored locally with SwiftData

## 🌍 Localization & Theming

ExpenseLens is built to feel native in both languages and both appearance modes from day one — not bolted on afterward:

- **Languages**: English & Arabic (String Catalogs)
- **Layout direction**: Full RTL/LTR support using `leading`/`trailing` semantics throughout — no hardcoded left/right positioning
- **Appearance**: Light & Dark mode via adaptive Color Assets, tested across both in every screen

## 🏗 Architecture

Built following **MVVM** with a **Repository pattern** for clean separation between data and presentation:

View → ViewModel → Repository (protocol) → SwiftData


**Why this architecture:**
- ViewModels depend on repository *protocols*, not concrete SwiftData implementations — enabling isolated unit testing via fake repositories
- Each screen owns its own ViewModel (Single Responsibility), while sharing repositories across screens to avoid data-access duplication
- Business logic (progress calculations, budget totals) lives in ViewModels — never in Views or the data layer

### Applying SOLID

| Principle | Where it shows up |
|---|---|
| Single Responsibility | Each ViewModel handles one screen's state; Repository handles only data access |
| Open/Closed | New data sources (e.g. remote API) can be added without modifying existing ViewModels |
| Liskov Substitution | Any repository implementation (SwiftData, Fake, future remote) is interchangeable |
| Interface Segregation | Separate protocols per entity type (Transaction, Category) instead of one large protocol |
| Dependency Inversion | ViewModels depend on protocols, injected at initialization — not on SwiftData directly |

## 🛠 Tech Stack

- **UI**: SwiftUI
- **Architecture**: MVVM + Repository Pattern + Dependency Injection
- **Persistence**: SwiftData
- **Async**: Swift Concurrency (async/await)
- **Localization**: String Catalogs (.xcstrings)

## 📂 Project Structure

ExpenseLens/
├── App/
├── Core/
│ ├── Networking/
│ ├── Persistence/
├── DesignSystem/
├── Features/
│ ├── Dashboard/
│ ├── AddTransaction/
│ ├── CategoryBreakdown/
│ ├── Budget/
│ ├── Reports/
├── Resources/
└── Tests/


## 🚀 Getting Started

1. Clone the repo
2. Open `ExpenseLens.xcodeproj` in Xcode 16+
3. Build and run on iOS 17+ simulator or device

## 📌 Roadmap / Stretch Goals

- [ ] Receipt scanning via VisionKit
- [ ] Recurring transactions
- [ ] CSV export
- [ ] iCloud sync via CloudKit

## 👤 Author

Suhaib — iOS Developer

