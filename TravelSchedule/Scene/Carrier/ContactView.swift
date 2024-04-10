//
//  ContactView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 09.04.2024.
//

import SwiftUI

struct ContactView: View {
    let type: String
    let information: String
    
    init(type: String, information: String) {
        self.type = type
        self.information = information
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: -4) {
            HStack {
                Text(type)
                    .font(Font.Regular.size17)
                    .foregroundColor(.tsBlackTopic)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Text(information)
                .font(Font.Regular.size12)
                .foregroundColor(.tsBlue)
                .multilineTextAlignment(.leading)
        }
        .background(.clear)
        .padding(.vertical, 12)
    }
}

#Preview {
    ContactView(type: "E-mail", information: "i.lozgkina@yandex.ru")
}
