//
//  CharacteristicState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit


class HKCharacteristicState: ObservableObject, HKCharacteristicControllable {
    func updateCharacteristics() {
        
    }
    
    var container: HKCharacteristicContainerable
    
    var readPermissions: [ReadPermissions] = [.characteristic(.biologicalSex), .characteristic(.dateOfBirth), .quantity(.bodyMass), .quantity(.height), .quantity(.heartRate), .quantity(.restingHeartRate)]
    
    @Published var biologicalSex: HKBiologicalSex?
    @Published var dateOfBirth: DateComponents?
    @Published var bodyMass: HKQuantitySample?
    @Published var maxHR: HKQuantitySample?
    @Published var restingHR: HKQuantitySample?
    
    init(container: HKCharacteristicContainerable){
        self.container = container
        biologicalSex = try? container.biologicalSex().biologicalSex
        dateOfBirth = try? container.dateOfBirthComponents()
        let pred = HKQuery.predicateForSamples(withStart: .distantPast, end: .distantFuture, options: [.strictEndDate])
        let sort = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let weightQuery = HKSampleQuery(sampleType: .quantityType(forIdentifier: .bodyMass)!, predicate: pred, limit: 1, sortDescriptors: [sort]) {[weak self] query, samples, error in
            DispatchQueue.main.async {
                self?.bodyMass = samples?.first as? HKQuantitySample
            }
        }
        HKHealthStore().execute(weightQuery)
    }
}

