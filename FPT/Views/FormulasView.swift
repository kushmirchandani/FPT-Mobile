//
//  FormulasView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/4/23.
//

import SwiftUI

struct FormulasView: View {
    // New state variable to track the selected view mode
    @State private var selectedViewMode: ViewMode = .list

    // Enum to represent the available view modes
    enum ViewMode {
        case list
        case flashcard
    }

    var body: some View {
        NavigationView {
            VStack {
                // Switch to toggle between list and flashcard views
                Picker("", selection: $selectedViewMode) {
                    Text("List").tag(ViewMode.list)
                    Text("Flashcards").tag(ViewMode.flashcard)
                }
                .pickerStyle(SegmentedPickerStyle())
//                .padding(.horizontal)
                
                Spacer()
                
                // Conditionally render the list or flashcard view based on the selected view mode
                if selectedViewMode == .list {
                    List(hardcodedFormulas) { formula in
                        NavigationLink(destination: formulaCard(formula: formula, isFormulaCardVisible: true)) {
                            formulaCard(formula: formula, isFormulaCardVisible: true)
                        }
                    }
                } else {
                    FlashcardView(formulas: hardcodedFormulas)
                }
            }
            .navigationBarTitle("Formulas")
        }
        .preferredColorScheme(.dark)
    }
}

struct FormulasView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(formulas: hardcodedFormulas)
    }
}
