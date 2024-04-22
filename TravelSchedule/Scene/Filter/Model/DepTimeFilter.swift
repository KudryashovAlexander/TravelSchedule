//
//  DepTimeFilter.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.04.2024.
//

import Foundation

enum DepTimeFilter: CaseIterable {
    case morning
    case dayTime
    case evening
    case night
    
    var depTimeModel: DepTimeModel {
        switch self {
        case .morning:
            DepTimeModel(name: L.Filter.morning,
                         startTime: 6,
                         endTime: 12)
        case .dayTime:
            DepTimeModel(name: L.Filter.dayTime,
                         startTime: 12,
                         endTime: 18)
        case .evening:
            DepTimeModel(name: L.Filter.evening,
                         startTime: 18,
                         endTime: 0)
        case .night:
            DepTimeModel(name: L.Filter.night,
                         startTime: 0,
                         endTime: 6)
        }
    }
}
