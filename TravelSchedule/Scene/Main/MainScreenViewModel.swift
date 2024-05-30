//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 30.05.2024.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    var currentStory: Int = 0
    private(set) var stories: [StoryModel] = StoryModel.examples
}
