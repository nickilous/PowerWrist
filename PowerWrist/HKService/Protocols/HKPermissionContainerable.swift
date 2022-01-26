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

enum ReadPermissions {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
    case characteristic(CharacteristicType)
    case activitySummary(ActivitySummaryType)
}
enum WritePermissions {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
}

protocol HKPermissionContainerable {
    func requestAuthorization(toShare: Set<HKSampleType>?, read: Set<HKObjectType>?, completion: @escaping (Bool, Error?) -> Void)
    func authorizationStatus(for type: HKObjectType) -> HKAuthorizationStatus
    func getRequestStatusForAuthorization(toShare: Set<HKSampleType>, read: Set<HKObjectType>, completion: @escaping (HKAuthorizationRequestStatus, Error?) -> Void)
    func requestAuthorization(toShare typesToShare: Set<HKSampleType>, read typesToRead: Set<HKObjectType>) async throws
}
