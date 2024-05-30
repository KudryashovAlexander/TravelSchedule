//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject private var coordinator: MainCoordinator
    
    @State private var storyIsPersented: Bool = false
    @ObservedObject private var viewModel = MainScreenViewModel()
    
    private var stateIsEmpty: Bool {
        !coordinator.departure.isEmpty && !coordinator.arrive.isEmpty
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack(spacing: 20) {
                storiesStackView
                VStack(spacing: 16) {
                    DepartureAndArrival(departure: $coordinator.departure,
                                        arrive: $coordinator.arrive) {
                        coordinator.currentStopType = .departure
                        coordinator.push(.choiseCity)
                    } arriveCompletion: {
                        coordinator.currentStopType = .arrive
                        coordinator.push(.choiseCity)
                    }
                    Button(action: {
                        coordinator.push(.carriers)
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
        .fullScreenCover(isPresented: $storyIsPersented, content: {
            StoryScreenView(stories: viewModel.stories, currentStory: viewModel.currentStory)
        })
    }
    
    private var storiesStackView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories.indices, id: \.self) { index in
                    storyView(viewModel.stories[index])
                        .padding(.leading, index == 0 ? 16 : 0)
                        .padding(.trailing, index == (viewModel.stories.count - 1) ? 16 : 0)
                        .onTapGesture {
                            viewModel.currentStory = index
                            storyIsPersented.toggle()
                        }
                }
            }
        }
        .padding(.vertical, 24)
    }
    
    @ViewBuilder
    private func storyView(_ model: StoryModel) -> some View {
        ZStack {
            Image(model.image)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 8)
                .foregroundColor(.tsBlue)
                .opacity(model.isViewed ? 0 : 1)
                
            VStack {
                Spacer()
                Text(model.title)
                    .font(.Regular.size12)
                    .lineLimit(3)
                    .foregroundColor(.tsWhite)
                    .padding(.horizontal, 8)
                    .padding(.bottom,12)
            }
        }
        .cornerRadius(16)
        .frame(width: 92, height: 140)
        .opacity(model.isViewed ? 0.5 : 1)
    }
}

#Preview {
    @StateObject var coordinator = MainCoordinator.preview
    return MainScreenView()
            .environmentObject(coordinator)
}
