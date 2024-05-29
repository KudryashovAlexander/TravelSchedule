//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//

import SwiftUI

struct StoryView: View {
    let story: StoryModel

    var body: some View {
        ZStack {
            Image(story.image)
                .resizable()
                .scaledToFill()
                .cornerRadius(40)
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    Text(story.title)
                        .font(.Bold.size34)
                        .lineLimit(2)
                        .foregroundColor(.white)
                    Text(story.subTitle)
                        .font(.Regular.size20)
                        .lineLimit(3)
                        .foregroundColor(.white)
                }
                .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
            }
        }
        .background(.clear)
    }
}

#Preview {
    StoryView(story: .example)
}
