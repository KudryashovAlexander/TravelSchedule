//
//  ChoisenStationScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import SwiftUI

struct ChoisenStationScreen: View {
    
    @ObservedObject var viewModel: ChoisenStationViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)
            if !viewModel.filterStations.isEmpty {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(viewModel.filterStations, id: \.self) { station in
                            CellView(title: station) {
                                coordinator.addStopType(station)
                                coordinator.popToRoot()
                            }
                                .frame(height: 60)
                        }
                    })
                }
            } else {
                Text(L.CheckStation.notFound)
                    .font(Font.Bold.size24)
                    .foregroundColor(.tsBlackTopic)
                    .frame(maxHeight: .infinity)
            }
        }
        .modifyNavigation(title: L.CheckStation.station)
    }

}

#Preview {
    @StateObject var coordinator = Coordinator.preview
    return ChoisenStationScreen(viewModel: .preview).environmentObject(coordinator)
}
