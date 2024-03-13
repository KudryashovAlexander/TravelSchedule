//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 02.03.2024.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    var body: some Scene {
        WindowGroup {
            ServerTestView(networkService: TestNetworkService())
        }
    }
}
