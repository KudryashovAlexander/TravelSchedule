//
//  StoriesStackView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 15.04.2024.
//

import SwiftUI

struct StoriesStackView: View {
    
    @State private var stories: [StoryModel] = StoryModel.examples
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(stories.indices, id: \.self) { index in
                    storyView(stories[index])
                        .padding(.leading, index == 0 ? 16 : 0)
                        .padding(.trailing, index == (stories.count - 1) ? 16 : 0)
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
    StoriesStackView()
}
