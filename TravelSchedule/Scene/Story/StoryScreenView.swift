//
//  StoryScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//
import Combine
import SwiftUI

struct StoryScreenView: View {
    
    private let stories: [StoryModel]
    private var currentStory: StoryModel { stories[currentStoryIndex] }
    private var currentStoryIndex: Int {
        if progress > Float(stories.count - 1) {
            return stories.count - 1
        } else if progress <= 0{
            return 0
        } else {
            return Int(progress)
        }
    }
    @Environment (\.dismiss) var dismiss
    @State private var progress: Float = 0
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init(stories: [StoryModel],
        currentStory: Int) {
        self.stories = stories
        self.progress = Float(currentStory)
        timer = Self.createTimer()
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.tsBlack.ignoresSafeArea()
            GeometryReader { geometry in
                StoryView(story: currentStory)
                    .animation(
                        Animation
                            .easeInOut(duration: 0.5)
                            .delay(0.5)
                        ,value: currentStory
                    )
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { value in
                                let tapLocation = value.location
                                let screenWidth = geometry.size.width
                                if tapLocation.x < screenWidth / 2 {
                                    nextStory(typeGesture: .left)
                                } else {
                                    nextStory(typeGesture: .right)
                                }
                            }
                    
                    )
                VStack(alignment: .trailing, spacing: 5) {
                    ProgressBarView(numberOfSections: stories.count, progress: progress)
                        .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
                        .animation(
                            .linear(duration: 0.5), value: progress
                        )
                    Button(action: {
                        dismiss()
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
        }

    }
    
    private static func createTimer() -> Timer.TimerPublisher {
        Timer.publish(every: 0.5, on: .main, in: .common)
    }
    
    private func timerTick() {
        let newProgress = progress + 0.05
        setProgress(newProgress)
    }
    
    private func nextStory(typeGesture: TypeGesture) {
        var newProgress: Float = 0
        if typeGesture == .right {
            newProgress =  progress.truncatingRemainder(dividingBy: 1) == 0 ? progress + 1 : ceil(progress)
            setProgress(newProgress)
        } else {
            newProgress =  progress.truncatingRemainder(dividingBy: 1) > 0.33 ? floor(progress) : floor(progress) - 1
            setProgress(newProgress)
        }
        
    }
    
    private func setProgress(_ newValue: Float) {
        if newValue > Float(stories.count) {
            progress = Float(stories.count)
            dismiss()
        } else if newValue < 0 {
            progress = 0
        } else {
            progress = newValue
        }
    }
    
    enum TypeGesture {
        case left, right
    }
}

#Preview {
    StoryScreenView(stories: StoryModel.examples, currentStory: 0)
}
