//
//  Formula.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/7/23.
//

import SwiftUI

struct Formula: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let provided: Bool
}

// Sample hardcoded formulas
let hardcodedFormulas: [Formula] = [
    Formula(name: "Pythagorean Theorem", description: "a² + b² = c²", imageName: "formula_pythagorean", provided: false),
    Formula(name: "Quadratic Formula", description: "x = (-b ± √(b² - 4ac)) / 2a", imageName: "quadratic", provided:false),
    Formula(name: "Area of a Circle", description: "A = πr²", imageName: "circle_area", provided:true),
    // Add more formulas here...
    Formula(name: "The Great Proportion", description: "", imageName: "formula_TGP", provided: false)
]
