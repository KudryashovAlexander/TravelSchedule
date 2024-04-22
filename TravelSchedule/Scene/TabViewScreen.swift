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
            MainCoordinatorView()
                .tabItem {
                    Label("", image: "mainTabBarItem")
                }
            
            SettingCoordinatorView()
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
