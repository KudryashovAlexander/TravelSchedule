//
//  DateFormatter.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import Foundation

extension String {
    
    func dateFromString_HH_mm_ss() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.date(from: self)
    }
    
    func dateFromString_yyyy_MM_dd() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
    
}

extension Date {
    
    func dateToString_HH_mm() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func dateToString_dd_MMMM() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: self)
    }
    
    func hoursCount(to date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let hours1 = Int(dateFormatter.string(from: self)) ?? 0
        let hours2 = Int(dateFormatter.string(from: date)) ?? 0
        return abs(hours2 - hours1)
    }
    
}
