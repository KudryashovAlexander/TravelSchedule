//
//  ChoiseCityScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import SwiftUI

struct ChoiseCityScreen: View {
    
    @ObservedObject var viewModel: ChoisenCityViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
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
        .modifyNavigation(title: L.CheckCity.city)
    }
}

#Preview {
    @StateObject var coordinator = Coordinator.preview
    return ChoiseCityScreen(viewModel: .preview)
            .environmentObject(coordinator)
}
