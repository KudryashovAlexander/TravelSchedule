//
//  StoryModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import Foundation

struct StoryModel: Hashable {
    let id: Int
    let image: ImageResource
    let title: String
    let subTitle: String
    var isViewed: Bool
    
    static let example = StoryModel(id: 0,
        image: .history1,
                                      title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      isViewed: false)
    
    static let examples: [StoryModel] = [StoryModel(id: 0,
                                                    image: .history1,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: true),
                                         StoryModel(id: 1,
                                                    image: .history2,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: true),
                                         StoryModel(id: 2,
                                                    image: .history3,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: false),
                                         StoryModel(id: 3,
                                                    image: .history4,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: false),
                                         StoryModel(id: 4,
                                                    image: .history5,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: false),
                                         StoryModel(id: 5,
                                                    image: .history6,
                                                    title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                    isViewed: false)]
}

