//
//  ChoisenStationViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import Foundation

final class ChoisenStationViewModel: ObservableObject {
    
    private var stations: [String] = ["Киевский вокзал", "Курский вокзал", "Ярославский вокзал", "Белоруский вокзал","Савеловский вокзал", "Ленинградский вокзал"]
    @Published var searchText: String = ""
    
    var filterStations: [String] {
        guard !searchText.isEmpty else {
            return stations
        }
        return stations.filter {
           return $0.lowercased().contains(searchText.lowercased())
        }
    }
    
    static var preview = ChoisenStationViewModel()
}
