//
//  SettingScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import SwiftUI

struct SettingScreenView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            darkTheme
            CellView(title: L.Settings.politycy)
                .frame(height: 60)
            Spacer()
            VStack(spacing: 16) {
                Text(L.Settings.apiTitle)
                    .multilineTextAlignment(.center)
                    .font(Font.Regular.size12)
                Text(L.Settings.apiVersion)
                    .multilineTextAlignment(.center)
                    .font(Font.Regular.size12)
            }
            .foregroundColor(.tsBlackTopic)
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            
        }
    }
    
    private var darkTheme: some View {
        HStack {
            Text(L.Settings.darktheme)
                .font(Font.Regular.size17)
                .foregroundColor(.tsBlackTopic)
            Spacer()
            Toggle("", isOn: $isOn)
                .tint(Color.blue)
        }
        .frame(height: 60)
        .padding(.horizontal, 16)
    }
}

#Preview {
    @State var isOn = true
    return SettingScreenView(isOn: $isOn)
}
