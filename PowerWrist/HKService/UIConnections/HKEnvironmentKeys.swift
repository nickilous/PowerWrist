//
//  HKEnvironmentKeys.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import SwiftUI


struct HKAvailabilityEnvironmentKey: EnvironmentKey {
    static let defaultValue: HKAvailability = .unavailable
}


extension EnvironmentValues {
    var hkAvailability: HKAvailability {
        get { self[HKAvailabilityEnvironmentKey.self] }
        set { self[HKAvailabilityEnvironmentKey.self] = newValue }
    }
}
