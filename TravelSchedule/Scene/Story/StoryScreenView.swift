//
//  StoryScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//
import Combine
import SwiftUI

struct StoryScreenView: View {
    
    private let stories = StoryModel.examples
    private var currentStory: StoryModel { stories[currentStoryIndex] }
    private var currentStoryIndex: Int = 0
    
    @State private var progress: Float = 0
    @State private var timer: Timer.TimerPublisher?
    @State private var cancellable: Cancellable?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.tsBlack.ignoresSafeArea()
            StoryView(story: currentStory)
            VStack(alignment: .trailing, spacing: 5) {
                ProgressBarView(numberOfSections: stories.count, progress: 3.5)
                    .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
                Button(action: {
                    //скрить экран
                }, label: {
                    Image(.close)
                })
                .padding(.horizontal, 12)
            }
            
        }
    }
}

#Preview {
    StoryScreenView()
}
