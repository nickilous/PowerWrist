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
    var permissionState: HKPermissionState = .init(container: HKHealthStore())
    var characteristicState: HKCharacteristicState = .init(container: HKHealthStore())
    
    var body: some View {
        Text(characteristicState.characteristics.biologicalSex?.description ?? "Bug")
            .onAppear {
                
            }
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
