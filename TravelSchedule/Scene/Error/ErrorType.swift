//
//  ErrorType.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import Foundation

enum ErrorType: String, Identifiable {
    case network
    case server
    
    var id: String {
        "error" + self.rawValue
    }
}
