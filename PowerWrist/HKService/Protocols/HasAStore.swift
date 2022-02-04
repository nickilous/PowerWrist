//
//  HasAStore.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation


protocol HasAStore {
    associatedtype Store
    var store: Store { get }
}
