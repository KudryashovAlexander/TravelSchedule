//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 13.04.2024.
//

import Foundation

final class CarriersViewModel: ObservableObject {
    
    private var carriers: [CarrierUIModel]
    
    var filterTime = Set<Int>()
    var filterTransfer: Bool = true
    
    @Published var filterCarriers: [CarrierUIModel]
    @Published var filterIsChange: Bool
    
    init(carriers: [CarrierUIModel] = CarrierUIModel.examples,
         filterCarriers: [CarrierUIModel] = CarrierUIModel.examples,
         filterIsChange: Bool = false) {
        self.carriers = carriers
        self.filterCarriers = filterCarriers
        self.filterIsChange = filterIsChange
    }
    
    static let prewiew = CarriersViewModel()
    static let prewiewEmpty = CarriersViewModel(carriers: CarrierUIModel.examplesEmpty,
                                                filterCarriers: CarrierUIModel.examplesEmpty,
                                                filterIsChange: true)
}
