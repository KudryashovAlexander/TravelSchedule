//
//  DepartureAndArrival.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 13.04.2024.
//

import SwiftUI

struct DepartureAndArrival: View {
    
    @Binding var departure: String
    @Binding var arrive: String
    
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.tsBlue
                .cornerRadius(20)
                .frame(height: 128)
            HStack(spacing: 16) {
                VStack(spacing:0) {
                    TextField(L.Main.from, text: $departure)
                        .padding(.horizontal,16)
                        .padding(.vertical, 14)
                    TextField(L.Main.to, text: $arrive)
                        .padding(.horizontal,16)
                        .padding(.vertical, 14)
                }
                .background(Color.tsWhiteTopic)
                .cornerRadius(20)
                
                Button(action: {
                    withAnimation(.linear(duration: 0.3)) {
                        rotation += 180
                        //поменять адреса
                    }
                    
                }, label: {
                    Image(.changeCities)
                })
                .rotationEffect(.degrees(rotation))
                
            }
            .padding(.all, 16)
        }
    }
    
}

#Preview {
    @State var departure = ""
    @State var arrive = ""
    
    return DepartureAndArrival(departure: $departure, arrive: $arrive)
}
