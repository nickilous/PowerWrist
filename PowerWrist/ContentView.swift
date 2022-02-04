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
    @EnvironmentObject var permissionState: HKPermissionState
    @EnvironmentObject var characteristicState: HKCharacteristicState
    
    @Environment(\.availability) var hkAvailability: Availability
    
    var body: some View {
        TabView {
            SettingsView().tabItem {
                Image(systemName: "gearshape.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundColor(Color.accentColor)
                .font(.system(size: 16, weight: .regular))
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            
            .environmentObject(HKPermissionState(container: HKHealthStore()))
            .environmentObject(HKCharacteristicState(container: HKHealthStore()))
        
        ContentView()
            .environment(\.availability, .unavailable(AvailabilityError(error: .storeUnavailable)))
            .environmentObject(HKPermissionState(container: HKHealthStore()))
            .environmentObject(HKCharacteristicState(container: HKHealthStore()))
    }
}
