//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 30.05.2024.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    var currentStory: Int = 0
    @Published var stories: [StoryModel]
    
    init(currentStory: Int = 0, stories: [StoryModel] = StoryModel.examples) {
        self.currentStory = currentStory
        self.stories = stories
    }
    
    func sortStories() {
        stories = stories.sorted {
            if $0.isViewed == $1.isViewed {
                return $0.id < $1.id
            } else {
                return !$0.isViewed && $1.isViewed
            }
        }
    }

}
