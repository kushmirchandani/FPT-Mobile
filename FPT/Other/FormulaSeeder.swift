////
////  FormulaSeeder.swift
////  FPT
////
////  Created by Kush Mirchandani on 8/7/23.
////
//
//import Foundation
//import CoreData
//
//class FormulaSeeder {
//    static func seedFormulasIfNeeded() {
//        let context = PersistenceController.shared.container.viewContext
//
//        // Check if the database is already seeded by fetching the formulas
//        let fetchRequest: NSFetchRequest<Formulas> = Formulas.fetchRequest()
//        do {
//            let formulas = try context.fetch(fetchRequest)
//
//            // If the formulas array is empty, it means the database is not yet seeded
//            if formulas.isEmpty {
//                // Perform the seeding process by creating and saving formula instances
//                seedFormulas(context: context)
//            }
//        } catch {
//            print("Error fetching formulas: \(error)")
//        }
//    }
//
//    private static func seedFormulas(context: NSManagedObjectContext) {
//        // Create and save your formula instances here
//        // Example:
//        let quadraticFormula = Formulas(context: context)
//        quadraticFormula.formulaName = "Quadratic Formula"
//        quadraticFormula.formulaDescription = "The quadratic formula is used to find the roots of a quadratic equation."
//        quadraticFormula.note = "Make sure to check the sign in the equation before plugging in values."
//        quadraticFormula.imageData = UIImage(named: "quadratic_formula_image")?.pngData()
//
//        // Save the changes to Core Data
//        do {
//            try context.save()
//        } catch {
//            print("Error saving formulas: \(error)")
//        }
//    }
//}
