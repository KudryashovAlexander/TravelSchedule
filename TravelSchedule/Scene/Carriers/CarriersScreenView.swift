//
//  CarriersScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct CarriersScreenView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    let viewModel: CarriersViewModel
    
    init(viewModel: CarriersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            ScrollView {
                Text(coordinator.departure + " → " + coordinator.arrive)
                    .font(.Bold.size24)
                    .foregroundColor(.tsBlackTopic)
                    .lineLimit(3)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                if !viewModel.filterCarriers.isEmpty {
                    LazyVStack(spacing: 8, content: {
                        ForEach(viewModel.filterCarriers.indices) { index in
                            CarrierView(model: viewModel.filterCarriers[index])
                                .padding(.horizontal, 16)
                                .padding(.bottom, index == (viewModel.filterCarriers.count - 1) ? 126 : 0)
                                .onTapGesture {
                                    coordinator.push(.carrier(viewModel.filterCarriers[index]))
                                }
                        }
                    })
                } else {
                    Text(L.Carriers.notFound)
                        .font(.Bold.size24)
                        .foregroundColor(.tsBlackTopic)
                        .frame(maxHeight: .infinity)
                }
                
            }
            VStack {
                Spacer()
                Button(action: {
                    coordinator.push(.filter)
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
        .modifyNavigation(title: "")
    }
}

#Preview {
    @StateObject var coordinator = Coordinator.preview
    return CarriersScreenView(viewModel: CarriersViewModel.prewiew).environmentObject(coordinator)
}
