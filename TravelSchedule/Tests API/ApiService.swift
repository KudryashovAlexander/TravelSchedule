//
//  ApiService.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.03.2024.
//

import Foundation
enum ApiServise: CaseIterable {
    case scheduleBetweenStations
    case scheduleStation
    case routeStations
    case nearestStation
    case nearestCity
    case carrierIformation
    case stationList
    case copyright
    
    var name: String {
        switch self {
        case .scheduleBetweenStations:
            "Расписание рейсов между станциями"
        case .scheduleStation:
            "Расписание рейсов по станции"
        case .routeStations:
            "Список станций следования"
        case .nearestStation:
            "Список ближайших станций"
        case .nearestCity:
            "Ближайший город"
        case .carrierIformation:
            "Информация о перевозчике"
        case .stationList:
            "Список всех доступных станций"
        case .copyright:
            "Копирайт Яндекс Расписаний"
        }
    }
}
