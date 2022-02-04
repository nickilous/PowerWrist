//
//  HasWritePermissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation


protocol HasWritePermissions {
    associatedtype WP
    var writePermissions: [WP] { get set }
}
