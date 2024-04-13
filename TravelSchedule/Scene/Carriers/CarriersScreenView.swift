//
//  CarriersScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct CarriersScreenView: View {
    
    let viewModel: CarriersViewModel
    
    init(viewModel: CarriersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            ScrollView {
                Text(viewModel.departureStation + " → " + viewModel.arriveStation)
                    .font(.Bold.size24)
                    .foregroundColor(.tsBlackTopic)
                    .lineLimit(3)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                LazyVStack(spacing: 8, content: {
                    ForEach(viewModel.filterCarriers.indices) { index in
                        CarrierView(model: viewModel.filterCarriers[index])
                            .padding(.horizontal, 16)
                    }
                })
                
            }
            VStack {
                Spacer()
                Button(action: {
                    //применить
                }, label: {
                    HStack(alignment: .center ,spacing: 4) {
                        Text(L.Carriers.checkTime)
                            .font(.Bold.size17)
                        if viewModel.filterIsChange {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(Color.tsRed)
                        }
                    }
                })
                .foregroundColor(.tsWhite)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.tsBlue)
                .cornerRadius(16)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            
        }
    }
}

#Preview {
    CarriersScreenView(viewModel: CarriersViewModel.prewiew)
}
