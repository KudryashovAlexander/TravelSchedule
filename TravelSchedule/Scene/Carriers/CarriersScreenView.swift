//
//  CarriersScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct CarriersScreenView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    
    let viewModel: CarriersViewModel
    
    init(viewModel: CarriersViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack {
                Text(coordinator.departure + " → " + coordinator.arrive)
                    .font(.Bold.size24)
                    .foregroundColor(.tsBlackTopic)
                    .lineLimit(3)
                    .padding(.all, 16)
                if !viewModel.filterCarriers.isEmpty {
                    ScrollView {
                        LazyVStack(spacing: 8, content: {
                            ForEach(viewModel.filterCarriers.indices, id:\.self) { index in
                                CarrierView(model: viewModel.filterCarriers[index])
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, index == (viewModel.filterCarriers.count - 1) ? 126 : 0)
                                    .onTapGesture {
                                        coordinator.push(.carrier(viewModel.filterCarriers[index]))
                                    }
                            }
                        })
                    }
                } else {
                    VStack {
                        Text(L.Carriers.notFound)
                            .font(.Bold.size24)
                            .foregroundColor(.tsBlackTopic)
                            .frame(maxHeight: .infinity)
                    }
                    .padding(.bottom, 84)
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
        .modifyNavigation(title: ""){
            coordinator.pop()
        }
    }
}

#Preview("Data") {
    @StateObject var coordinator = MainCoordinator.preview
    return CarriersScreenView(viewModel: CarriersViewModel.prewiew).environmentObject(coordinator)
}

#Preview("EmptyData") {
    @StateObject var coordinator = MainCoordinator.preview
    return CarriersScreenView(viewModel: CarriersViewModel.prewiewEmpty).environmentObject(coordinator)
}
