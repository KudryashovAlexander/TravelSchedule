//
//  TransferView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 10.04.2024.
//

import SwiftUI

struct TransferView: View {
    
    let name: String
    var isOn: Bool
    @Binding var currentIsOn: Bool
    
    let completion: () -> Void
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.Regular.size17)
                .foregroundColor(.tsBlackTopic)
            Spacer()
            Image(currentIsOn == isOn ? .selectedCircle : .unSelectedCircle)
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
    @State var currentIsOn = false
    return TransferView(name: "Да", isOn:true, currentIsOn: $currentIsOn) {
        
    }
    .background(Color.gray)
}
