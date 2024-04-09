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
                Image(checkImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 223, height: 223)
                    .cornerRadius(70)
                
                Text(checkTitle())
                    .font(Font.Bold.size24)
                    .foregroundColor(Color.tsBlackTopic)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    private func checkImage() -> ImageResource {
        switch errorType {
        case .network:
            .networkError
        case .server:
            .serverError
        }
    }
    
    private func checkTitle() -> String {
        switch errorType {
        case .network:
            L.NetworkError.connect
        case .server:
            L.NetworkError.server
        }
    }
}

#Preview {
    ErrorView(errorType: .network)
}
