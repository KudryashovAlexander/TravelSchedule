//
//  StoryScreenView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//
import Combine
import SwiftUI

struct StoryScreenView: View {
    
    @Binding var stories: [StoryModel]
    @Binding private var isShowScreen: Bool
    @State private var progress: Float = 0
    @State private var selectionTab: Int = 0
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init(stories: Binding<[StoryModel]>,
         isShowScreen: Binding<Bool>,
         currentStory: Int) {
        self._stories = stories
        self._isShowScreen = isShowScreen
        self.progress = Float(currentStory)
        self.selectionTab = currentStory
        timer = Self.createTimer()
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.tsBlack.ignoresSafeArea()
            TabView(selection: $selectionTab.onUpdate {
                setProgress(Float(selectionTab))
            }) {
                ForEach(stories.indices, id: \.self) { index in
                    StoryView(story: stories[index])
                        .tag(index)
                        .onTapGesture(count: 1, coordinateSpace: .global, perform: { point in
                            if point.x < UIScreen.main.bounds.midX {
                                nextStory(typeGesture: .left)
                            } else {
                                nextStory(typeGesture: .right)
                            }
                        })
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            VStack(alignment: .trailing, spacing: 5) {
                ProgressBarView(numberOfSections: stories.count, progress: progress)
                    .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
                    .animation(
                        .linear(duration: 0.5), value: progress
                    )
                Button(action: {
                    isShowScreen = false
                }, label: {
                    Image(.close)
                })
                .padding(.horizontal, 12)
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
            isShowScreen = false
        } else if newValue < 0 {
            progress = 0
        } else {
            progress = newValue
            if Int(progress) != selectionTab {
                withAnimation {
                    selectionTab = Int(progress)
                }
            }
            if progress.truncatingRemainder(dividingBy: 1) > 0.33 {
                if !stories[selectionTab].isViewed {
                    stories[selectionTab].isViewed.toggle()
                }
            }
        }
    }
    
    enum TypeGesture {
        case left, right
    }
}

#Preview {
    @State var models = StoryModel.examples
    @State var isShow = false
    return StoryScreenView(stories: $models, isShowScreen: $isShow, currentStory: 0)
}


extension Binding {
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}
