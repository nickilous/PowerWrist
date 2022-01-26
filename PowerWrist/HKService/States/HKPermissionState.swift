//
//  HKPermissionState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import Combine
class HKPermissionState: ObservableObject, HKPermissionControllable {

    var readPermissions: [ReadPermissions] = []
    var writePermissions: [WritePermissions] = []
    
    var container: AHKPermissionContainerable
    
    init(container: AHKPermissionContainerable) {
        self.container = container
    }
    
    func addRead(permission: ReadPermissions) {
        self.readPermissions.append(permission)
    }
    
    func addWrite(permission: WritePermissions) {
        self.writePermissions.append(permission)
    }
    func addRead(permissions: [ReadPermissions]) {
        for permission in permissions {
            self.readPermissions.append(permission)
        }
    }
    func addWrite(permissions: [WritePermissions]) {
        for permission in permissions {
            self.writePermissions.append(permission)
        }
    }
    func checkPermissions() async throws {
        try await self.container.permissions(forSharing: writePermissions, forReading: readPermissions)
    }
}
