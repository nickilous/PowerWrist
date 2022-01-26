//
//  HKBiologicalSexExt.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit


extension HKBiologicalSex: CustomStringConvertible {
    public var description: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .notSet:
            return "Not Set"
        case .other:
            return "Other"
        default:
            return "Unknown Setting"
        }
    }
}
