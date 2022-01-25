//
//  CorrelationType.swift
//  HealthKitReporter
//
//  Created by Victor on 05.10.20.
//

import Foundation
import HealthKit

/**
 All HealthKit correlation types
 */
public enum CorrelationType: Int, CaseIterable, SampleType {
    case bloodPressure
    case food

    public var identifier: String? {
        return hkobject?.identifier
    }
    public var hkobject: HKObjectType? {
        return sampleType
    }
    public var sampleType: HKSampleType? {
        switch self {
        case .food:
            return HKSampleType.correlationType(forIdentifier: .food)
        case .bloodPressure:
            return HKSampleType.correlationType(forIdentifier: .bloodPressure)
        }
    }
}
