//
//  BubbleSheetView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/9/23.
//

import SwiftUI

struct BubbleSheetView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bubble Sheet")
                    .font(.title)
                    .padding()

                NavigationLink("Start Bubble Sheet", destination: BubbleSheetView())
                    .padding()
            }
            .navigationBarTitle("Bubble Sheet")
        }
    }
}

enum BubbleSectionType {
    case reading
    case writing
    case mathNoCalculator
    case mathWithCalculator
    
    var totalQuestions: Int {
        switch self {
        case .reading: return 52
        case .writing: return 44
        case .mathNoCalculator: return 25
        case .mathWithCalculator: return 38
        }
    }
}


struct BubbleRowView: View {
    let questionIndex: Int
    @State private var selectedAnswerIndex: Int = -1

    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width / 20) {
            Text("Q\(questionIndex + 1):")
                .fontWeight(.bold)
                .frame(width: 60, alignment: .trailing)

            ForEach(0..<4, id: \.self) { answerIndex in
                BubbleView(selected: answerIndex == selectedAnswerIndex, letter: String(UnicodeScalar(UInt8(65 + answerIndex))))
                    .onTapGesture {
                        selectedAnswerIndex = answerIndex
                    }
            }
        }
    }
}

struct BubbleView: View {
    var selected: Bool
    var letter: String

    var body: some View {
        ZStack {
            Capsule()
                .fill(selected ? Color.black : Color.white)
                .frame(width: UIScreen.main.bounds.width / 7, height: 40)
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: selected ? 2 : 1)
                )
            if !selected {
                Text(letter)
                    .font(.headline)
                    .foregroundColor(selected ? .white : .black)
            }
        }
    }
}

struct BubbleSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleSheetView()
    }
}
