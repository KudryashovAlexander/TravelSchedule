//
//  ChoiseCityScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import SwiftUI

struct ChoiseCityScreen: View {
    
    @ObservedObject var viewModel: ChoisenCityViewModel
    @EnvironmentObject private var coordinator: MainCoordinator
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack {
                SearchBar(searchText: $viewModel.searchText)
                if !viewModel.filterCities.isEmpty {
                    ScrollView {
                        LazyVStack(content: {
                            ForEach(viewModel.filterCities, id: \.self) { city in
                                CellView(title: city) {
                                    coordinator.clearCity()
                                    coordinator.addStopType(city)
                                    coordinator.push(.choiseStation)
                                }
                                .frame(height: 60)
                            }
                        })
                    }
                } else {
                    Text(L.CheckCity.notFound)
                        .font(Font.Bold.size24)
                        .foregroundColor(.tsBlackTopic)
                        .frame(maxHeight: .infinity)
                }
            }
            .modifyNavigation(title: L.CheckCity.city) {
                coordinator.pop()
            }
        }
    }
}

#Preview {
    @StateObject var coordinator = MainCoordinator.preview
    return ChoiseCityScreen(viewModel: .preview)
            .environmentObject(coordinator)
}
