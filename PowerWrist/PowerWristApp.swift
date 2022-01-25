//
//  PowerWristApp.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import SwiftUI

@main
struct PowerWristApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
