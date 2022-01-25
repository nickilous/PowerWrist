//
//  PowerWristApp.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import SwiftUI
import HealthKit

@main
struct PowerWristApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.hkAvailability, HKHealthStore.isHealthDataAvailable())
        }
    }
}
