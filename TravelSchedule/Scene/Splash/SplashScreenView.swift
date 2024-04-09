//
//  SplashScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image(.launchScreen)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
    }
}

#Preview {
    SplashScreenView()
}
