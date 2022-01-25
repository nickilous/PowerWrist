//
//  AHKContainer.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

extension HKHealthStore: AHKContainerable { }

protocol AHKContainerable: HKContainerable {
}

extension AHKContainerable {
    static func availability() async -> HKAvailability {
        return await withCheckedContinuation({ continuation in
            continuation.resume(returning: isHealthDataAvailable())
        })
    }
}
