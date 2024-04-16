//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 02.03.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(type: .main)
                .navigationDestination(for: Page.self, destination: { type in
                    coordinator.build(type: type)
                })
                .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
