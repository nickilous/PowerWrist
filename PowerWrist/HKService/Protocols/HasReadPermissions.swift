//
//  HasReadPermissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation


protocol HasReadPermissions {
    associatedtype RP
    var readPermissions: [RP] { get set }
}

