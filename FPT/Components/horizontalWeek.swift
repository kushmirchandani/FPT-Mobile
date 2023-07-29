//
//  horizontalWeek.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/4/23.
//

import SwiftUI

struct horizontalWeek: View {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE\nd"
        return formatter
    }()
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<7) { index in
                let firstWeekday = Calendar.current.firstWeekday
                let todayWeekday = Calendar.current.component(.weekday, from: Date())
                let dayOffset = (index + firstWeekday - todayWeekday + 7) % 7
                
                let date = Calendar.current.date(byAdding: .day, value: dayOffset, to: Date())!
                let dateString = dateFormatter.string(from: date)
                
                let isCurrentDay = Calendar.current.isDateInToday(date)
                let textColor: Color = isCurrentDay ? .white : .white.opacity(0.5)
                let backgroundColor: Color = isCurrentDay ? .clear : .clear
                let borderColor: Color = isCurrentDay ? .white : .clear
                
                Text(dateString)
                    .font(.headline)
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 60) // Adjust the frame width to fill the available width
                    .background(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(borderColor, lineWidth: 1)
                    )
            }
        }
        .padding(.horizontal, 10) // Add horizontal padding
    }
}


struct horizontalWeek_Previews: PreviewProvider {
    static var previews: some View {
        horizontalWeek()
    }
}
