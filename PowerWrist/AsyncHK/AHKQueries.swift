//
//  AHKQueries.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit


protocol AHKQuery {
    var store: HKHealthStore { get }
}

protocol AHKSampleQuery: AHKQuery {
    func sampleQuery(sampleType: HKSampleType,
                     predicate: NSPredicate?,
                     limit: Int,
                     sortDescriptors: [NSSortDescriptor]?) async throws -> HKSample
}

extension AHKSampleQuery {
    func sampleQuery(sampleType: HKSampleType,
                     predicate: NSPredicate?,
                     limit: Int,
                     sortDescriptors: [NSSortDescriptor]?) async throws -> [HKSample]? {
        
        return try await withCheckedThrowingContinuation({ continuation in
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: sortDescriptors) { query, samples, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: samples)
                }
            }
            store.execute(query)
        })
        
    }
}
protocol AHKStatisticQuery {
    func statisicQuery(quantityType: HKQuantityType,
                       quantitySamplePredicate: NSPredicate?,
                       options: HKStatisticsOptions) async throws -> HKStatistics
}


extension AHKStatisticQuery {
    func statisicQuery(quantityType: HKQuantityType,
                       quantitySamplePredicate: NSPredicate?,
                       options: HKStatisticsOptions) async throws -> HKStatistics? {
        return try await withCheckedThrowingContinuation({ continuation in
            let query = HKStatisticsQuery(quantityType: quantityType, quantitySamplePredicate: quantitySamplePredicate, options: options) { query, statistics, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: statistics)
                }
            }
        })
    }
}
