//
//  Permissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation

protocol HasReadPermissions {
    var readPermissions: [ReadPermissable] { get set }
}

protocol HasWritePermissions {
    var writePermissions: [WritePermissable] { get set }
}

protocol PermissionControllable: HasReadPermissions, HasWritePermissions {
    
}
