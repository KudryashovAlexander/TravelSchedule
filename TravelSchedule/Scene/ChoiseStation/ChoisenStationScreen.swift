//
//  ChoisenStationScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import SwiftUI

struct ChoisenStationScreen: View {
    @ObservedObject var viewModel: ChoisenStationViewModel
    
    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)
            if !viewModel.filterStations.isEmpty {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(viewModel.filterStations, id: \.self) { station in
                            CellView(title: station)
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
    }

}

#Preview {
    ChoisenStationScreen(viewModel: .preview)
}
