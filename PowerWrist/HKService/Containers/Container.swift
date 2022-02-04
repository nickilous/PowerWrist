//
//  HKContainer.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation
import HealthKit


class Container<Store> : HasAStore {
   
    
    var store: Store
    
    init(store: Store){
        self.store = store
    }
    
    
}

extension Container : Permissioner {
    func receive(state: PermissionState) {
        
    }
    
    func receive(permission: ReadPermissions) {
        add(read: permission)
    }
}

protocol Permissioner {
    func receive(state: PermissionState)
}

extension Permissioner {
    func add(read: ReadPermissions) {
        PermissionState.shared.add(read: read)
    }
}

class PermissionState: HasReadPermissions, HasWritePermissions {
    
    static var shared: PermissionState {
        PermissionState()
    }
    
    var readPermissions: [ReadPermissions] = []
    var writePermissions: [WritePermissions] = []
    
    func add(read: ReadPermissions) {
        readPermissions.append(read)
    }
}

