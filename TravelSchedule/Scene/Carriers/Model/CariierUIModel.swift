//
//  CariierUIModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import Foundation

struct CarrierUIModel: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let transer: String?
    let image: ImageResource
    let departureTime: Date
    let arriveTime: Date
    let departureDay: Date
    let travelTime: Int
    
    init(name: String,
         transer: String?,
         image: ImageResource,
         departureTime: Date,
         arriveTime: Date,
         dayDate: Date,
         travelTime: Int) {
        self.name = name
        self.transer = transer
        self.image = image
        self.departureTime = departureTime
        self.arriveTime = arriveTime
        self.departureDay = dayDate
        self.travelTime = travelTime
    }
    
    init(name: String,
         transer: String?,
         image: ImageResource,
         departureTimeString: String,
         arriveTimeString: String,
         departureDayString: String,
         travelTime: Int
    ) {
        self.name = name
        self.transer = transer
        self.image = image
        self.departureTime = departureTimeString.dateFromString_HH_mm_ss() ?? Date()
        self.arriveTime = arriveTimeString.dateFromString_HH_mm_ss() ?? Date()
        self.departureDay = departureDayString.dateFromString_yyyy_MM_dd() ?? Date()
        self.travelTime = travelTime
    }
    
    static let example = CarrierUIModel(name: "РЖД",
                                        transer: "С пересадкой в Костроме",
                                        image: .carrier1,
                                        departureTimeString: "22:30:00",
                                        arriveTimeString: "08:15:00",
                                        departureDayString: "2024-01-14",
                                        travelTime: 20)
    
    static let examples:[CarrierUIModel] = [CarrierUIModel(name: "РЖД",
                                                           transer: "С пересадкой в Костроме",
                                                           image: .carrier1,
                                                           departureTimeString: "22:30:00",
                                                           arriveTimeString: "08:15:00",
                                                           departureDayString: "2024-01-14",
                                                           travelTime: 20),
                                            CarrierUIModel(name: "ФГК",
                                                           transer: nil,
                                                           image: .carrier2,
                                                           departureTimeString: "01:15:00",
                                                           arriveTimeString: "09:00:00",
                                                           departureDayString: "2024-01-15",
                                                           travelTime: 9),
                                            CarrierUIModel(name: "Урал логистика",
                                                           transer: nil,
                                                           image: .carrier3,
                                                           departureTimeString: "12:30:00",
                                                           arriveTimeString: "21:00:00",
                                                           departureDayString: "2024-01-16",
                                                           travelTime: 9),
                                            CarrierUIModel(name: "РЖД",
                                                           transer: nil,
                                                           image: .carrier1,
                                                           departureTimeString: "22:30:00",
                                                           arriveTimeString: "08:15:00",
                                                           departureDayString: "2024-01-17",
                                                           travelTime: 20),
                                            CarrierUIModel(name: "РЖД",
                                                           transer: nil,
                                                           image: .carrier1,
                                                           departureTimeString: "00:30:00",
                                                           arriveTimeString: "20:15:00",
                                                           departureDayString: "2024-01-18",
                                                           travelTime: 20),
    ]
    
    static let examplesEmpty:[CarrierUIModel] = []
    
}
