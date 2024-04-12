//
//  ChoisenCityViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 12.04.2024.
//

import Foundation

final class ChoisenCityViewModel: ObservableObject {
    
    private var cities: [String] = ["Москва", "Санкт Петербург", "Сочи", "Горный воздух","Краснодар", "Казань", "Омск"]
    @Published var searchText: String = ""
    
    var filterCities: [String] {
        guard !searchText.isEmpty else {
            return cities
        }
        return cities.filter {
           return $0.lowercased().contains(searchText.lowercased())
        }
    }
    
    
    static var preview = ChoisenCityViewModel()
}
