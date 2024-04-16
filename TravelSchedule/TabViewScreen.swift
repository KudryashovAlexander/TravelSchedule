//
//  TabViewScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI

struct TabViewScreen: View {
    var body: some View {
        TabView {
            CoordinatorView()
                .tabItem {
                    Label("", image: "mainTabBarItem")
                }
            
            SettingScreenView()
                .tabItem {
                    Label("", image: "settingTabBarItem")
                }
        }
        .accentColor(.tsBlackTopic)
    }
}

#Preview {
    TabViewScreen()
}
