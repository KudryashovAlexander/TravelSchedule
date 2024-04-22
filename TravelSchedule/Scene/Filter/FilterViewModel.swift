//
//  FilterViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.04.2024.
//

import Foundation

final class FilterViewModel: ObservableObject {
    
    @Published var timeFilters: [DepTimeModel]
    @Published var tranferIsOn: Bool = false
    @Published var filterIsChange: Bool = true
    
    init() {
        self.timeFilters = DepTimeFilter.allCases.compactMap { $0.depTimeModel }
    }
    
    
}
