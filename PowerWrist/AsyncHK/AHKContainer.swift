//
//  AHKContainer.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit



protocol AHKContainer {
    static func isHealthDataAvailable() -> HKAvailability
}

extension AHKContainer {
    static func availability() async -> HKAvailability {
        return await withCheckedContinuation({ continuation in
            if HKHealthStore.isHealthDataAvailable() {
                continuation.resume(returning: .available)
            } else {
                continuation.resume(returning: .unavailable)
            }
        })
    }
}
