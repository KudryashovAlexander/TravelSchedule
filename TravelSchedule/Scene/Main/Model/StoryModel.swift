//
//  StoryModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import Foundation

struct StoryModel: Hashable {
    let id = UUID()
    let image: ImageResource
    let title: String
    let subTitle: String
    var isViewed: Bool
    
    static let example = StoryModel(image: .history1,
                                      title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      isViewed: false)
    
    static let examples: [StoryModel] = [
                                            StoryModel(image: .history1,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: false),
                                            StoryModel(image: .history2,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: false),
                                            StoryModel(image: .history3,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            StoryModel(image: .history4,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            StoryModel(image: .history5,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            StoryModel(image: .history6,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true)]
    
}

