//
//  Coordinator.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    var departure: String = ""
    var arrive: String = ""
    
    var currentStopType = StopType.departure
        
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(type: Page) -> some View {
        switch type {
        case .main:
            mainView()
        case .choiseCity:
            choiseCity()
        case .choiseStation:
            choiseStation()
        case .filter:
            filterScreen()
        case .carriers:
            carriersScreen()
        case .carrier(let model):
            carrierScreen(model: model)
        case .setting:
            settingScreen()
        case .error(let errorType):
            errorScreen(errorType: errorType)
        }
    }
    
    func addStopType(_ text: String) {
        switch currentStopType {
        case .departure:
            if departure.isEmpty {
                departure = text
            } else {
                departure += " (\(text))"
            }
        case .arrive:
            if arrive.isEmpty {
                arrive = text
            } else {
                arrive += " (\(text))"
            }
        }
    }
    
    func clearCity() {
        switch currentStopType {
        case .departure:
            departure = ""
        case .arrive:
            arrive = ""
        }
    }
        
    @ViewBuilder
    private func mainView() -> some View {
        MainScreenView()
    }
    
    @ViewBuilder
    private func choiseCity() -> some View {
        let vm = ChoisenCityViewModel()
        ChoiseCityScreen(viewModel: vm)
    }
    
    @ViewBuilder
    private func choiseStation() -> some View {
        let vm = ChoisenStationViewModel()
        ChoisenStationScreen(viewModel: vm)
    }
    
    @ViewBuilder
    private func filterScreen() -> some View {
        let vm = FilterViewModel()
        FilterScreenView(viewModel: vm)
    }
    
    @ViewBuilder
    private func carriersScreen() -> some View {
        CarriersScreenView(viewModel: CarriersViewModel())
    }
    
    @ViewBuilder
    private func carrierScreen(model: CarrierUIModel) -> some View {
        CarrierInformationScreenView(logo: model.image,
                                     carrierName: model.name,
                                     email: "i.lozgkina@yandex.ru",
                                     phone: "+7 (904) 329-27-71")
    }
    
    @ViewBuilder
    private func settingScreen() -> some View {
        SettingScreenView()
    }
    
    @ViewBuilder
    private func errorScreen(errorType: ErrorType) -> some View {
        ErrorView(errorType: errorType)
    }
    
    static let preview = Coordinator()
    
}

enum Page: Identifiable, Hashable {
    case main
    case choiseCity
    case choiseStation
    case filter
    case carriers
    case carrier(CarrierUIModel)
    case setting
    case error(ErrorType)
    var id: String {
        switch self {
        case .main:
            "main"
        case .choiseCity:
            "choiseCity"
        case .choiseStation:
            "choiseStation"
        case .filter:
            "filter"
        case .carriers:
            "carriers"
        case .carrier(let model):
            "carrier" + model.id.uuidString
        case .setting:
            "setting"
        case .error(let errorType):
            errorType.rawValue
        }
    }
}

enum StopType: String, Identifiable {
    case departure
    case arrive
    var id: String {
        self.rawValue
    }
}
