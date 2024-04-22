//
//  CarrierInformationScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct CarrierInformationScreenView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    
    let logo: ImageResource
    let carrierName: String
    let email: String
    let phone: String
    
    init(logo: ImageResource, carrierName: String, email: String, phone: String) {
        self.logo = logo
        self.carrierName = carrierName
        self.email = email
        self.phone = phone
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack(alignment:.center, spacing: 16) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.tsWhite)
                    Image(logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity)
                }
                .frame(height: 104)
                .cornerRadius(24)
                HStack {
                    Text(carrierName)
                        .font(Font.Bold.size24)
                        .foregroundColor(.tsBlackTopic)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                VStack(spacing: 0) {
                    ContactView(type: L.Carriers.email, information: email)
                    ContactView(type: L.Carriers.phone, information: phone)
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .modifyNavigation(title: L.Carriers.information){
            coordinator.pop()
        }
    }
}

#Preview {
    @StateObject var coordinator = MainCoordinator.preview
    return CarrierInformationScreenView(logo: .carrier1,
                                 carrierName: "ОАО «РЖД»",
                                 email: "i.lozgkina@yandex.ru",
                                 phone: "+7 (904) 329-27-71").environmentObject(coordinator)
}
