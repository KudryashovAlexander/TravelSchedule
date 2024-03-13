//
//  ServerTestView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.03.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ServerTestView: View {
    
    private let networkService: TestNetworkService
    var body: some View {
        VStack(alignment:.center, spacing: 2) {
            ForEach(ApiServise.allCases, id: \.self) { apiService in
                Button {
                    buttonAction(apiService)
                } label: {
                    Text(apiService.name)
                        .font(.title2)
                        .padding()
                }
            }
        }
    }
    
    private func buttonAction(_ apiService: ApiServise) {
        switch apiService {
        case .scheduleBetweenStations:
            networkService.scheduleBetweenStations()
        case .scheduleStation:
            networkService.scheduleStation()
        case .routeStations:
            networkService.routeStations()
        case .nearestStation:
            networkService.stations()
        case .nearestCity:
            networkService.nearestCity()
        case .carrierIformation:
            networkService.carrierInformation()
        case .stationList:
            networkService.stationsList()
        case .copyright:
            networkService.copyright()
        }
    }

    init(networkService: TestNetworkService) {
        self.networkService = networkService
    }

}

#Preview {
    ServerTestView(networkService: .prewiev)
}
