//
//  SettingCoordinatorView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI

struct SettingCoordinatorView: View {
    @StateObject private var coordinator = SettingCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(type: .setting)
                .navigationDestination(for: SettingPage.self, destination: { type in
                    coordinator.build(type: type)
                })
                .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    SettingCoordinatorView()
}
