//
//  HKCharacteristicControllable.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation


protocol HKCharacteristicControllable: HasReadPermissions {
    var container: HKCharacteristicContainerable { get }
    func updateCharacteristics ()
}
