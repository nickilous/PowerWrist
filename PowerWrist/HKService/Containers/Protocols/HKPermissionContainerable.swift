//
//  Permissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

extension HKHealthStore: HKPermissionContainerable { }

protocol HKPermissionContainerable {
    func requestAuthorization(toShare: Set<HKSampleType>?, read: Set<HKObjectType>?, completion: @escaping (Bool, Error?) -> Void)
    func authorizationStatus(for type: HKObjectType) -> HKAuthorizationStatus
    func getRequestStatusForAuthorization(toShare: Set<HKSampleType>, read: Set<HKObjectType>, completion: @escaping (HKAuthorizationRequestStatus, Error?) -> Void)
    func requestAuthorization(toShare typesToShare: Set<HKSampleType>, read typesToRead: Set<HKObjectType>) async throws
}

extension HKPermissionContainerable {
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
}
