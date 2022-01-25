//
//  AHKPermissionController.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit

protocol AHKPermissionControllable: HasReadPermissions, HasWritePermissions, Controllable {
    var container: AHKPermissionContainerable { get }
    func addRead(permission: ReadPermissions)
    func addWrite(permission: WritePermissions)
    func checkPermissions() async throws
}
