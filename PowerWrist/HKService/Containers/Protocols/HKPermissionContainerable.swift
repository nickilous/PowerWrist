//
//  Permissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

extension HKHealthStore: HKPermissionContainerable { }

protocol HasReadPermissions {
    var readPermissions: [ReadPermissions] { get set }
}

protocol HasWritePermissions {
    var writePermissions: [WritePermissions] { get set }
}



protocol HKPermissionContainerable {
    func requestAuthorization(toShare: Set<HKSampleType>?, read: Set<HKObjectType>?, completion: @escaping (Bool, Error?) -> Void)
    func authorizationStatus(for type: HKObjectType) -> HKAuthorizationStatus
    func getRequestStatusForAuthorization(toShare: Set<HKSampleType>, read: Set<HKObjectType>, completion: @escaping (HKAuthorizationRequestStatus, Error?) -> Void)
    func requestAuthorization(toShare typesToShare: Set<HKSampleType>, read typesToRead: Set<HKObjectType>) async throws
}
