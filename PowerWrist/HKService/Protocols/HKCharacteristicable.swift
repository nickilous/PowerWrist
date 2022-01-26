//
//  HKCharacteristicable.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit

extension HKHealthStore: HKCharacteristicContainerable { }

protocol HKCharacteristicContainerable {
    func biologicalSex() throws -> HKBiologicalSexObject
    func dateOfBirthComponents() throws -> DateComponents
}


extension HKCharacteristicContainerable {
    func characteristics() -> CharacteristicModel {
        CharacteristicModel(biologicalSex: try? biologicalSex(),
                            birthday: try? dateOfBirthComponents(),
                            bloodType: nil,
                            fitzpatrickSkinType: nil,
                            wheelchairUse: nil)
    }
}

