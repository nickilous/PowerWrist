//
//  SeriesType.swift
//  HealthKitReporter
//
//  Created by Victor on 05.10.20.
//

import Foundation
import HealthKit

/**
 All HealthKit series types
 */
public enum SeriesType: Int, CaseIterable, SampleType {
    case heartbeatSeries
    case workoutRoute

    public var identifier: String? {
        return hkobject?.identifier
    }
    public var sampleType: HKSampleType? {
        return hkobject as? HKSampleType
    }
    public var hkobject: HKObjectType? {
        switch self {
        case .heartbeatSeries:
            if #available(iOS 13.0, *) {
                let heartbeatSeries = HKObjectType.seriesType(
                    forIdentifier: HKDataTypeIdentifierHeartbeatSeries
                )
                return heartbeatSeries ?? HKSeriesType.heartbeat()
            } else {
                return nil
            }
        case .workoutRoute:
            if #available(iOS 11.0, *) {
                let workoutRoute = HKObjectType.seriesType(
                    forIdentifier: HKWorkoutRouteTypeIdentifier
                )
                return workoutRoute ?? HKSeriesType.workoutRoute()
            } else {
                return nil
            }
        }
    }
}
