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
    @StateObject var permissionState: HKPermissionState = .init(container: HKHealthStore())
    @StateObject var characteristicState: HKCharacteristicState = .init(container: HKHealthStore())
    var body: some Scene {
        WindowGroup {
            ContentView()
                
                .environmentObject(permissionState)
                .environmentObject(characteristicState)
                .task {
                    permissionState.addRead(permissions: characteristicState.readPermissions)
                    permissionState.addRead(permission: .quantity(.height))
                    do {
                        try await permissionState.checkPermissions()
                    } catch  {
                        print(error)
                    }
                }
            
        }
    }
}

extension HKHealthStore: ObservableObject {}
