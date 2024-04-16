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
    @Published var filterIsChange: Bool = true
    
    init() {
        self.carriers = CarrierUIModel.examples
        self.filterCarriers = CarrierUIModel.examples
    }
    
    static let prewiew = CarriersViewModel()
}
