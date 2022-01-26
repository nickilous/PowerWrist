//
//  Container.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit

extension HKHealthStore: HKContainerable { }

protocol HKContainerable { }

extension HKContainerable {
    static func isHealthDataAvailable() -> HKAvailability {
        if HKHealthStore.isHealthDataAvailable() {
            return .available
        } else {
            return .unavailable
        }
    }
}
