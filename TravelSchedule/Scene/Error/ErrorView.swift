//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct ErrorView: View {
    
    let errorType: ErrorType
    
    init(errorType: ErrorType) {
        self.errorType = errorType
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            VStack(spacing: 16) {
                Image(errorType.info.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 223, height: 223)
                    .cornerRadius(70)
                
                Text(errorType.info.title)
                    .font(Font.Bold.size24)
                    .foregroundColor(Color.tsBlackTopic)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    ErrorView(errorType: .network)
}
