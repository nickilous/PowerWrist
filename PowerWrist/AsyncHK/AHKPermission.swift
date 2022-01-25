//
//  AHKPermission.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit


protocol AHKPermission {
    func requestAuthorization(toShare: Set<HKSampleType>?, read: Set<HKObjectType>?, completion: @escaping (Bool, Error?) -> Void)
    func authorizationStatus(for type: HKObjectType) -> HKAuthorizationStatus
    func getRequestStatusForAuthorization(toShare: Set<HKSampleType>, read: Set<HKObjectType>, completion: @escaping (HKAuthorizationRequestStatus, Error?) -> Void)
    func requestAuthorization(toShare typesToShare: Set<HKSampleType>, read typesToRead: Set<HKObjectType>) async throws
}


extension AHKPermission {
    public func permisions(forSharing: Set<HKSampleType>, forReading: Set<HKObjectType>) async throws {
        return  try await requestAuthorization(toShare: forSharing, read: forReading)
    }
    public func permission(for type: HKObjectType) async -> HKAuthorizationStatus {
        return await withCheckedContinuation({ continuation in
            continuation.resume(returning: authorizationStatus(for: type))
        })
    }
    public func permissionRequestStatus(forSharing: Set<HKSampleType>, forReading: Set<HKObjectType>) async throws -> HKAuthorizationRequestStatus {
        return try await withCheckedThrowingContinuation({ continuation in
            getRequestStatusForAuthorization(toShare: forSharing, read: forReading) { status, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: status)
                }
            }
        })
    }
}
