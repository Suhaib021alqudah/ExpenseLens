//
//  SettingsView.swift
//  ExpenseLens
//
//  Created by Trainee on 22/09/2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkModeEnabled: Bool = false
    @State private var switchLanguage   : Bool = false

    var body: some View {
        ZStack(alignment: .leading) {
            Color(.backgroundPrimary).ignoresSafeArea()
            VStack(alignment: .leading) {

                Text(.settings)
                    .font(AppTypography.pageTitle)
                
                Text(.appearance)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(.textSecondary)
                    .padding(.top, 10)
                VStack(alignment: .leading) {
                   
                    HStack {
                        Image(systemName: "sparkles").foregroundStyle(.navyForeground)
                            .frame(width: 40, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 16).fill(
                                    .navyBackround
                                )
                            )

                        VStack(alignment: .leading) {
                            Text(.darkmode).font(AppTypography.rowLabel)
                            Text(.darkmodetoggletext).font(
                                AppTypography.caption
                            )
                        }
                        Spacer()

                        Toggle("", isOn: $isDarkModeEnabled).labelsHidden()
                        
                 
                    }.padding(.vertical)
                    
                 
                    Divider()
                    HStack {
                        Image(systemName: "globe")
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.purpleForeground)
                            .background(
                                RoundedRectangle(cornerRadius: 16).fill(
                                    .purpleBackground
                                )
                            )
                        
                        VStack(alignment: .leading) {
                            Text(.arabic).font(AppTypography.rowLabel)
                            Text(.switchlanguagetext).font(
                                AppTypography.caption
                            )
                        }
                        Spacer()
                        
                        Toggle("", isOn: $switchLanguage).labelsHidden()
                    }.padding(.vertical)
                    
                }.padding(.horizontal,20).padding(.vertical,10).background(
                    RoundedRectangle(cornerRadius: 16).fill(
                        .whiteBackground
                    )
                )
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
                Spacer()

            }.padding()
        }
    }
}

#Preview {
    SettingsView()
}
