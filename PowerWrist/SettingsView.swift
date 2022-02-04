//
//  SettingsView.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    @EnvironmentObject var characteristicState: HKCharacteristicState
    @EnvironmentObject var settings: SettingsState
    
    @State var bodyMass: Measurement<UnitMass> = .init(value: 0.0, unit: .pounds)
    
    @Environment(\.availability) var availability
    
    var body: some View {
        switch availability {
        case .available:
            VStack {
                Text(bodyMass.formatted(.measurement(width: .abbreviated, usage: .asProvided, numberFormatStyle: .number.precision(.fractionLength(2)))))
                    .onReceive(settings.bodyMassPub) { measure in
                        bodyMass = characteristicState.bodyMass
                    }.onChange(of: settings.measurement) { newValue in
                        settings.subject.send(.update)
                    }
                Picker("Metric Picker", selection: $settings.measurement) {
                    ForEach(SettingsState.MetricType.allCases, id: \.id) { value in
                        Text(value.description).tag(value)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
        case .unavailable:
            Text("Unavailable")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(HKPermissionState(container: HKHealthStore()))
            .environmentObject(HKCharacteristicState(container: HKHealthStore()))
            .environmentObject(SettingsState())
            .environment(\.availability, .available)
    }
}
