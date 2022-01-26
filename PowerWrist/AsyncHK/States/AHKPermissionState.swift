//
//  PermissionState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit
import Combine

enum PermissionStateAction {
    case checkPermissions
}



class AHKPermissionState: ObservableObject, AHKPermissionControllable {
    var action: PassthroughSubject<PermissionStateAction, Never> = .init()
    var subscriptions: Set<AnyCancellable> = .init()
    
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
    
    func checkPermissions() async throws {
        try await self.container.permissions(forSharing: writePermissions, forReading: readPermissions)
    }
    
    
}
