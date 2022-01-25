//
//  WorkoutType.swift
//  HealthKitReporter
//
//  Created by Victor on 05.10.20.
//

import Foundation
import HealthKit

/**
 All HealthKit workout types
 */
public enum WorkoutType: Int, CaseIterable, SampleType {
    case workoutType

    public var identifier: String? {
        return hkobject?.identifier
    }
    public var hkobject: HKObjectType? {
        return sampleType
    }
    public var sampleType: HKSampleType? {
        switch self {
        case .workoutType:
            return HKSampleType.workoutType()
        }
    }
}
