//
//  FilterScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct FilterScreenView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    @ObservedObject var viewModel: FilterViewModel
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        depTimeView
                        optionsView
                    }
                }
                if viewModel.filterIsChange {
                    Button(action: {
                        coordinator.pop()
                    }, label: {
                        Text(L.Filter.apply)
                            .foregroundColor(.tsWhite)
                            .font(Font.Bold.size17)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.tsBlue)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
        }
        .modifyNavigation(title: ""){
            coordinator.pop()
        }
    }
    
    private var depTimeView: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L.Filter.depTime)
                    .font(Font.Bold.size24)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.tsBlackTopic)
                Spacer()
            }
                .padding(.horizontal, 16)
            VStack(spacing:0) {
                ForEach(viewModel.timeFilters.indices, id:\.self) { index in
                    TimeFilterView(title: viewModel.timeFilters[index].name,
                                   filterIsOn: $viewModel.timeFilters[index].filterIsOn) {
                        viewModel.timeFilters[index].changeFilter()
                    }
                }
            }
        }
    }
    
    private var optionsView: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L.Filter.options)
                    .font(Font.Bold.size24)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.tsBlackTopic)
                Spacer()
            }
                .padding(.horizontal, 16)
            VStack {
                TransferView(name: L.Main.yes,
                             isOn: true,
                             currentIsOn: $viewModel.tranferIsOn) {
                    viewModel.tranferIsOn = true
                }
                TransferView(name: L.Main.no,
                             isOn: false,
                             currentIsOn: $viewModel.tranferIsOn) {
                    viewModel.tranferIsOn = false
                }
            }
        }
    }
}

#Preview {
    @StateObject var coordinator = MainCoordinator.preview
    return FilterScreenView(viewModel: FilterViewModel()).environmentObject(coordinator)
}
