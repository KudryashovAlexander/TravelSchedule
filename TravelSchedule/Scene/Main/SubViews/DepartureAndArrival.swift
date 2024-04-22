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
    
    let departureCompletion: () -> Void
    let arriveCompletion: () -> Void
    
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.tsBlue
                .cornerRadius(20)
                .frame(height: 128)
            HStack(spacing: 16) {
                VStack(spacing:0) {
                    Button(action: {
                        departureCompletion()
                    }, label: {
                        HStack {
                            Text(departure.isEmpty ? L.Main.from : departure)
                                .foregroundColor(departure.isEmpty ? .tsGray : .tsBlack)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.horizontal,16)
                        .padding(.vertical, 14)
                    })
                    
                    Button(action: {
                        arriveCompletion()
                    }, label: {
                        HStack {
                            Text(arrive.isEmpty ? L.Main.to : arrive)
                                .foregroundColor(arrive.isEmpty ? .tsGray : .tsBlack)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.horizontal,16)
                        .padding(.vertical, 14)
                    })
                }
                .background(Color.tsWhite)
                .cornerRadius(20)
                
                Button(action: {
                    withAnimation(.linear(duration: 0.3)) {
                        rotation += 180
                        let text = departure
                        departure = arrive
                        arrive = text
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
    
    return DepartureAndArrival(departure: $departure, arrive: $arrive) {
        //
    } arriveCompletion: {
        //
    }

}
