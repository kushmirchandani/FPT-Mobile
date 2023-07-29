//
//  testDateCountdown.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/4/23.
//

import SwiftUI

struct testDateCountdown: View {
    private var testDate: Date {
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 26
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var timeRemaining = ""

    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTimeRemaining()
        }
    }

    var body: some View {
        VStack {
            Text(timeRemaining)
                .font(.callout)
        }
        .onAppear {
            updateTimeRemaining()
        }
        .onDisappear {
            timer.invalidate()
        }
    }

    private func updateTimeRemaining() {
        let currentTime = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: currentTime, to: testDate)

        if let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second {
            if days > 0 {
                timeRemaining = "\(days) days till game day!"
//                timeRemaining = "\(days) days \(hours)h \(minutes)m \(seconds)s"
            } else if hours > 0 {
                timeRemaining = "\(hours)h \(minutes)m \(seconds)s"
            } else if minutes > 0 {
                timeRemaining = "\(minutes)m \(seconds)s"
            } else {
                timeRemaining = "\(seconds)s"
            }
        }
    }
}

struct testDateCountdown_Previews: PreviewProvider {
    static var previews: some View {
        testDateCountdown()
    }
}
