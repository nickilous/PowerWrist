//
//  CanCheckAvailability.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation

enum Availability {
    case available
    case unavailable(Error)
}

protocol CanCheckAvailability {
    func isAvailable() -> Availability
}
