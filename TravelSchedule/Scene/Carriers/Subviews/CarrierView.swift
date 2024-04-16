//
//  CarrierView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 11.04.2024.
//

import SwiftUI

struct CarrierView: View {
    
    let model: CarrierUIModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.tsLightGray)
            VStack {
                carrier
                times
            }
            .background(.clear)
            .padding(.horizontal, 14)
            .padding(.top, 14)
        }
        .frame(height: 104)
        .cornerRadius(24)
    }
    
    private var carrier: some View {
        HStack(spacing:8) {
            Image(model.image)
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .cornerRadius(12)
            names
            VStack {
                Text(model.departureDay.dateToString_dd_MMMM())
                    .font(Font.Regular.size12)
                    .foregroundColor(.tsBlack)
                Spacer()
            }
        }
        .frame(height: 38)
    }
    
    private var names: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(model.name)
                    .font(Font.Regular.size17)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.tsBlack)
                Spacer()
            }
            if let transfer = model.transer {
                Text(transfer)
                    .font(Font.Regular.size12)
                    .foregroundColor(.tsRed)
            }
        }
    }
    
    private var times: some View {
        HStack {
            basicTimeView(model.departureTime.dateToString_HH_mm())
            rectangle
            travelTime
            rectangle
            basicTimeView(model.arriveTime.dateToString_HH_mm())
        }
        .padding(.vertical, 14)
    }
    
    private var rectangle: some View {
        Rectangle()
            .frame(height: 1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.tsGray)
            .padding(.horizontal, 4)
    }
    
    private var travelTime: some View {
        Text(countHoursString(model.travelTime))
            .font(Font.Regular.size12)
            .foregroundColor(.tsBlack)
    }
    
    @ViewBuilder
    private func basicTimeView(_ timeString: String) -> some View {
        Text(timeString)
            .font(Font.Regular.size17)
            .foregroundColor(.tsBlack)
    }
    
    private func countHoursString(_ number: Int) -> String {
        return String.localizedStringWithFormat(NSLocalizedString("countHours", comment: "rewiew count"),
                                                number)
    }
    
    
}

#Preview {
    CarrierView(model: .example)
}
