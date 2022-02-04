//
//  HKEnvironmentKeys.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import SwiftUI


struct AvailabilityError: Error {
    enum ErrorCode {
        case storeUnavailable
    }
    
    var error: ErrorCode
    
    init(error: ErrorCode) {
        self.error = error
    }
}

struct AvailabilityEnvironmentKey: EnvironmentKey {
    static let defaultValue: Availability = .unavailable(AvailabilityError(error: .storeUnavailable))
}


extension EnvironmentValues {
    var availability: Availability {
        get { self[AvailabilityEnvironmentKey.self] }
        set { self[AvailabilityEnvironmentKey.self] = newValue }
    }
}
