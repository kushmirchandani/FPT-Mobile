//
//  flashcardView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/7/23.
//
import SwiftUI

struct FlashcardView: View {
    @State private var currentFormulaIndex = 0
    @State private var isFormulaRevealed = false
    
    let formulas: [Formula] // Your array of formula objects
    
    var body: some View {
        VStack {
            Text(formulas[currentFormulaIndex].name)
                .font(.title)
                .padding()
            
            if isFormulaRevealed {
                Image(systemName: formulas[currentFormulaIndex].imageName)
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
            }
            
            Button(action: {
                isFormulaRevealed.toggle()
            }) {
                Text(isFormulaRevealed ? "Hide Formula" : "Reveal Formula")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            HStack {
                Button("Previous") {
                    currentFormulaIndex = (currentFormulaIndex - 1 + formulas.count) % formulas.count
                    isFormulaRevealed = false
                }
                .disabled(isFormulaRevealed)
                
                Spacer()
                
                Button("Next") {
                    currentFormulaIndex = (currentFormulaIndex + 1) % formulas.count
                    isFormulaRevealed = false
                }
                .disabled(isFormulaRevealed)
            }
            .padding(.horizontal)
        }
        .padding()
        .onTapGesture {
            isFormulaRevealed = !isFormulaRevealed
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(formulas: hardcodedFormulas)
    }
}

//import SwiftUI
//
//struct FlashcardView: View {
//    @GestureState private var dragOffset: CGSize = .zero
//    @State private var currentIndex = 0
//    @State private var isFormulaCardVisible = false // Add a state variable to control formula card visibility
//
//    var body: some View {
//        VStack(spacing: 10) {
//            ZStack {
//                // Large white card to display formula name
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.6) // Adjust the card size
//                    .cornerRadius(15)
//                    .onTapGesture {
//                        // Toggle the visibility of the formula card on tap
//                        withAnimation {
//                            isFormulaCardVisible.toggle()
//                        }
//                    }
//
//                // Formula card that will be shown when tapped
//                if isFormulaCardVisible {
//                    formulaCard(formula: hardcodedFormulas[currentIndex], isFormulaCardVisible: true)
//                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.6) // Adjust the card size
//                }
//
//                // Overlay with the formula name when formula card is hidden
//                if !isFormulaCardVisible {
//                    VStack {
//                        Text(hardcodedFormulas[currentIndex].name)
//                            .font(.title)
//                            .foregroundColor(.black)
//                            .padding()
//                            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.6)
//                            .background(Color.white)
//                            .cornerRadius(15)
//                    }
//                }
//            }
//            .animation(.default)
//
//            HStack(spacing: 10) {
//                ForEach(hardcodedFormulas.indices, id: \.self) { index in
//                    Circle()
//                        .fill(index == currentIndex ? Color.white : Color.gray)
//                        .frame(width: 10, height: 10)
//                }
//            }
//        }
//        .padding()
//        .gesture(
//            DragGesture()
//                .updating($dragOffset, body: { value, state, _ in
//                    state = value.translation
//                })
//                .onEnded({ value in
//                    let threshold = UIScreen.main.bounds.width / 2
//                    let newIndex = Int(value.translation.width / threshold) + currentIndex
//                    currentIndex = min(max(newIndex, 0), hardcodedFormulas.count - 1)
//                    // Reset the formula card visibility when the card is swiped to the next formula
//                    isFormulaCardVisible = false
//                })
//        )
//        .preferredColorScheme(.dark)
//    }
//}
//
//struct flashcardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlashcardView()
//    }
//}
