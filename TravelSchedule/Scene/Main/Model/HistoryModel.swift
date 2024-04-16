//
//  HistoryModel.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import Foundation

struct HistoryModel: Hashable {
    let id = UUID()
    let image: ImageResource
    let title: String
    let subTitle: String
    var isViewed: Bool
    
    static let example = HistoryModel(image: .history1,
                                      title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                      isViewed: false)
    
    static let examples: [HistoryModel] = [
                                            HistoryModel(image: .history1,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: false),
                                            HistoryModel(image: .history2,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: false),
                                            HistoryModel(image: .history3,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            HistoryModel(image: .history4,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            HistoryModel(image: .history5,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true),
                                            HistoryModel(image: .history6,
                                                         title: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         subTitle: "Text Text Text Text Text Text Text Text Text Text Text Text Text",
                                                         isViewed: true)]
    
}

