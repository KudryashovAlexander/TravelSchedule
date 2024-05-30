//
//  ProgressBarView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 29.05.2024.
//

import SwiftUI

struct ProgressBarView: View {
    let numberOfSections: Int
    let progress: Float
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(1...numberOfSections, id: \.self) { index in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .frame(height: 6)
                        .foregroundColor(.white)
                    if (Float(index) - ceil(progress)) <= 0 && progress <= Float(numberOfSections)  {
                        GeometryReader(content: { geometry in
                            RoundedRectangle(cornerRadius: 3)
                                .frame(width: progress >= Float(index) ?
                                       geometry.size.width : (CGFloat((progress - Float(index - 1))) * geometry.size.width),
                                       height: 6)
                                .foregroundColor(.tsBlue)
                        })
                    }
                }
                .frame(height: 6)
            }
        }
    }
}

#Preview {
    Color.gray
        .ignoresSafeArea()
        .overlay(
            ProgressBarView(numberOfSections: 5, progress: 5)
                .padding()
        )
}
