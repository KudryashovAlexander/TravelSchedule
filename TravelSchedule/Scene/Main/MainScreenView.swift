//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    
    private var stateIsEmpty: Bool {
        !coordinator.departure.isEmpty && !coordinator.arrive.isEmpty
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack(spacing: 20) {
                StoriesStackView()
                VStack(spacing: 16) {
                    DepartureAndArrival(departure: $coordinator.departure,
                                        arrive: $coordinator.arrive) {
                        coordinator.currentStopType = .departure
                        coordinator.push(.choiseCity)
                    } arriveCompletion: {
                        coordinator.currentStopType = .arrive
                        coordinator.push(.choiseCity)
                    }
                    Button(action: {
                        coordinator.push(.carriers)
                    }, label: {
                        Text(L.Main.find)
                    })
                    .frame(width: 150, height: 60)
                    .foregroundColor(.tsWhite)
                    .background(Color.tsBlue)
                    .cornerRadius(16)
                    .opacity(stateIsEmpty ? 1 : 0 )
                }
                .padding(.horizontal, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    @StateObject var coordinator = MainCoordinator.preview
    return MainScreenView()
            .environmentObject(coordinator)
}
