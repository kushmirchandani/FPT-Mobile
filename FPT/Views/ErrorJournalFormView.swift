//
//  ErrorJournalFormView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/8/23.
//

import SwiftUI
import CoreData

// Define Core Data entity
@objc(ErrorJournalEntry)
public class ErrorJournalEntry: NSManagedObject {
    @NSManaged public var test: String
    @NSManaged public var questionNumber: Int16
    @NSManaged public var mistake: String
    @NSManaged public var notes: String
    @NSManaged public var image: Data?
    @NSManaged public var tags: [String]
}

struct ErrorJournalFormView: View {
    @State private var testName = ""
    @State private var questionNumber = ""
    @State private var mistake = ""
    @State private var selectedTags: [String] = []
    @State private var notes = ""
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Error Journal Entry")) {
                    TextField("Test Name", text: $testName)
                    TextField("Question Number", text: $questionNumber)
                    TextField("Mistake", text: $mistake)
                    // Add TagsView component (you need to define this)
                    // MultilineTextField component (you need to define this)
                    // ImagePicker component (you need to define this)
                }
                
                Section {
                    Button("Save Entry") {
                        // Convert UIImage to Data
                        let imageData = selectedImage?.pngData()
                        
                        // Save data to Core Data
                        let context = PersistenceController.shared.container.viewContext
                        let newEntry = ErrorJournalEntry(context: context)
                        newEntry.test = testName // Use 'testName' instead of 'test'
                        newEntry.questionNumber = Int16(questionNumber) ?? 0
                        newEntry.mistake = mistake
                        newEntry.notes = notes
                        newEntry.image = imageData
                        newEntry.tags = selectedTags
                        
                        do {
                            try context.save()
                            // Reset form fields
                            testName = ""
                            questionNumber = ""
                            mistake = ""
                            notes = ""
                            selectedTags = []
                            selectedImage = nil
                        } catch {
                            // Handle error
                        }
                    }
                }
            }
            .navigationBarTitle("Error Journal Entry", displayMode: .inline)
        }
    }
}

struct ErrorJournalFormView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorJournalFormView()
    }
}
