//
//  SplashScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        Image(.launchScreen)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .onAppear {
                isPresented = true
            }
            .fullScreenCover(isPresented: $isPresented, content: {
                TabViewScreen()
            })
    }
}

#Preview {
    SplashScreenView()
}
