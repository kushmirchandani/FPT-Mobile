//
//  formulaCard.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/7/23.
//

import SwiftUI

struct formulaCard: View {
    let formula: Formula
    let isFormulaCardVisible: Bool // Add a new parameter to determine if the formula card is visible
    
    var body: some View {
        ZStack {
            if isFormulaCardVisible {
                //                 Formula card with image
                VStack(alignment: .leading, spacing: 8) {
                    Image(formula.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .frame(width: 280)
                        .cornerRadius(10)
                    
                    Text(formula.name)
                        .font(.headline)
                    
//                    Text(formula.description)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            } else {
                //                 Large white card with formula name
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .overlay(
                        Text(formula.name)
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                    )
            }
        }
    }
    
    
    struct formulaCard_Previews: PreviewProvider {
        static var previews: some View {
            formulaCard(formula: hardcodedFormulas[0], isFormulaCardVisible: true)
        }
    }
}
