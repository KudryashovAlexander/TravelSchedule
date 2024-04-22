//
//  TimeFilterView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 10.04.2024.
//

import SwiftUI

struct TimeFilterView: View {
    
    let title: String
    @Binding var filterIsOn: Bool
    
    let completion: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(Font.Regular.size17)
                .foregroundColor(.tsBlackTopic)
            Spacer()
            Image(filterIsOn ? .selectedSquare : .unSelectedSquare)
                .frame(width:24, height: 24)
                .onTapGesture {
                    completion()
                }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 16)
    }
}

#Preview {
    @State var filterIsOn = false
    return TimeFilterView(title: "Утро 06:00 - 12:00", filterIsOn: $filterIsOn) {
        
    }
    .background(Color.gray)
}
