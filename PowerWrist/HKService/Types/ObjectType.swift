//
//  ObjectType.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation
import HealthKit

protocol ObjectType: ReadPermissable {
    var hkobject: HKObjectType? { get }
}

extension ObjectType {
    var readPermission: HKObjectType? {
        return hkobject
    }
}

protocol ReadPermissable {
    var readPermission: HKObjectType? { get }
}
