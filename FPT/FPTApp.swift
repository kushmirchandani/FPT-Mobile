//
//  FPTApp.swift
//  FPT
//
//  Created by Kush Mirchandani on 7/29/23.
//

import SwiftUI

@main
struct FPTApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
