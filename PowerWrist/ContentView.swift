//
//  ContentView.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import SwiftUI
import CoreData
import HealthKit

struct ContentView: View {
    var permissionState: AHKPermissionState = .init(container: HKHealthStore())
    
    var body: some View {
        Text("Select an item").task {
            permissionState.addRead(permission: .quantity(.height))
            do {
                try await permissionState.checkPermissions()
            } catch  {
                print(error)
            }
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
