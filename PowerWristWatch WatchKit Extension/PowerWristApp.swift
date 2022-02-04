//
//  PowerWristApp.swift
//  PowerWristWatch WatchKit Extension
//
//  Created by Nicholas Hartman on 2/4/22.
//

import SwiftUI

@main
struct PowerWristApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
