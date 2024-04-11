//
//  DepTimeModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.04.2024.
//

import SwiftUI

struct DepTimeModel: Hashable {
    let id = UUID()
    let name: String
    let startTime: Int
    let endTime: Int
    var filterIsOn: Bool = true
    
    mutating func changeFilter() {
        filterIsOn.toggle()
    }
}
