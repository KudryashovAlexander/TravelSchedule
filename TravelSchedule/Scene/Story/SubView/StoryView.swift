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
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(story.image)
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(40)
    }
}

#Preview {
    StoryView(story: .examples[3])
}
