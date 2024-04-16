//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var departure: String = ""
    @State private var arrive: String = ""
    
    private var stateIsEmpty: Bool {
        !departure.isEmpty && !arrive.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HistoriesView()
            VStack(spacing: 16) {
                DepartureAndArrival(departure: $departure, arrive: $arrive)
                
                Button(action: {
                    
                }, label: {
                    Text(L.Main.find)
                })
                .frame(width: 150, height: 60)
                .foregroundColor(.tsWhite)
                .background(Color.tsBlue)
                .cornerRadius(16)
                .opacity(stateIsEmpty ? 1 : 0 )
            }
            .padding(.horizontal, 16)
           Spacer()
        }
    }
}

#Preview {
    MainScreenView()
}
