//
//  AHKPermission.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

extension HKHealthStore: AHKPermissionContainerable {}

protocol AHKPermissionContainerable: HKPermissionContainerable, AHKContainerable {}


extension AHKPermissionContainerable {
    private func convertReadPermission(for permissions: [ReadPermissions]) async -> Set<HKObjectType> {
        await withCheckedContinuation({ continuation in
            let read = permissions.compactMap { permission -> HKObjectType? in
                switch permission {
                case .quantity(let perm):
                    return perm.readPermission
                case .category(let perm):
                    return perm.readPermission
                case .series(let perm):
                    return perm.readPermission
                case .electroCardioGram(let perm):
                    return perm.readPermission
                case .document(let perm):
                    return perm.readPermission
                case .workout(let perm):
                    return perm.readPermission
                case .correlation(let perm):
                    return perm.readPermission
                case .characteristic(let perm):
                    return perm.readPermission
                case .activitySummary(let perm):
                    return perm.readPermission
                }
            }
            let readSet: Set<HKObjectType> = .init(read)
            continuation.resume(returning: readSet)
        })
    }
    private func convertWritePermissions(for permissions: [WritePermissions]) async -> Set<HKSampleType> {
        await withCheckedContinuation({ continuation in
            let write = permissions.compactMap { permission -> HKSampleType? in
                switch permission {
                case .quantity(let perm):
                    return perm.writePermission
                case .category(let perm):
                    return perm.writePermission
                case .series(let perm):
                    return perm.writePermission
                case .electroCardioGram(let perm):
                    return perm.writePermission
                case .document(let perm):
                    return perm.writePermission
                case .workout(let perm):
                    return perm.writePermission
                case .correlation(let perm):
                    return perm.writePermission
                
                }
            }
            let writeSet: Set<HKSampleType> = .init(write)
            continuation.resume(returning: writeSet)
        })
    }
    public func permissions(forSharing: [WritePermissions], forReading: [ReadPermissions]) async throws {
        async let readSet = convertReadPermission(for: forReading)
        async let writeSet = convertWritePermissions(for: forSharing)
        return  try await requestAuthorization(toShare: writeSet, read: readSet)
    }
    public func permission(for type: WritePermissions) async throws -> HKAuthorizationStatus {
        let writeSet =  await convertWritePermissions(for: [type])
        return try await withCheckedThrowingContinuation({ continuation in
            if let perm = writeSet.first {
                continuation.resume(returning: authorizationStatus(for: perm))
            }
            continuation.resume(throwing: HKError(.errorInvalidArgument))
        })
    }
    public func permissionRequestStatus(forSharing: [WritePermissions], forReading: [ReadPermissions]) async throws -> HKAuthorizationRequestStatus {
        let readSet = await convertReadPermission(for: forReading)
        let writeSet = await convertWritePermissions(for: forSharing)
        return try await withCheckedThrowingContinuation({ continuation in
            getRequestStatusForAuthorization(toShare: writeSet, read: readSet) { status, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: status)
                }
            }
        })
    }
}
