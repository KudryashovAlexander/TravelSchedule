//
//  StoryScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//
import Combine
import SwiftUI

struct StoryScreenView: View {
    
    struct Configuration {
        let timerTickInternal: TimeInterval
        let progressPerTick: CGFloat

        init(
            storiesCount: Int,
            secondsPerStory: TimeInterval = 5,
            timerTickInternal: TimeInterval = 0.25
        ) {
            self.timerTickInternal = timerTickInternal
            self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
        }
    }
    
    private let stories = StoryModel.examples
    private var currentStory: StoryModel { stories[currentStoryIndex] }
    private var currentStoryIndex: Int { Int(progress)}
    
    @State private var progress: Float = 0
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init() {
        timer = Self.createTimer()
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.tsBlack.ignoresSafeArea()
            StoryView(story: currentStory)
                .animation(
                    .linear(duration: 0.5), value: progress
                )
            VStack(alignment: .trailing, spacing: 5) {
                ProgressBarView(numberOfSections: stories.count, progress: progress)
                    .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
                    .animation(
                        .linear(duration: 0.5), value: progress
                    )
                Button(action: {
                    //скрыть экран
                }, label: {
                    Image(.close)
                })
                .padding(.horizontal, 12)
            }
            
        }
        .onAppear {
            timer = Self.createTimer()
            cancellable = timer.connect()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer, perform: { _ in
            timerTick()
        })
        .onTapGesture {
            nextStory()
        }

    }
    
    private static func createTimer() -> Timer.TimerPublisher {
        Timer.publish(every: 0.5, on: .main, in: .common)
    }
    
    private func timerTick() {
        let newProgress = progress + 0.05
        setProgress(newProgress)
        print(progress)
    }
    
    private func nextStory() {
        let newProgress =  progress.truncatingRemainder(dividingBy: 1) == 0 ? progress + 1 : ceil(progress)
        setProgress(newProgress)
    }
    
    private func setProgress(_ newValue: Float) {
        progress =  newValue >= Float(stories.count) ? 0 : newValue
    }
}

#Preview {
    StoryScreenView()
}
