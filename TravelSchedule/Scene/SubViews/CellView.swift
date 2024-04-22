//
//  CellView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.04.2024.
//

import SwiftUI

struct CellView: View {
    let title: String
    let completion: () -> Void
    
    var body: some View {
        
        Button(action: {
            completion()
        }, label: {
            HStack {
                Text(title)
                    .font(Font.Regular.size17)
                Spacer()
                Image(.chevronRight)
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 16)
            .foregroundColor(.tsBlackTopic)
            .background(.clear)
        })
    }
}

#Preview {
    CellView(title: "Москва") {
        
    }
        .background(Color.tsGray)
}
