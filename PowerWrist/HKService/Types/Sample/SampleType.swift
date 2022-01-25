//
//  SampleType.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

protocol SampleType: ObjectType, WritePermissable {
    var sampleType: HKSampleType? { get }
}
extension SampleType {
    var writePermission: HKSampleType? {
        sampleType
    }
}
protocol WritePermissable {
    var writePermission: HKSampleType? { get }
}
