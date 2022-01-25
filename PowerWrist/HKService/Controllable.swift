//
//  Controllable.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import Combine

protocol Controllable {
    associatedtype T
    var action: PassthroughSubject<T, Never> { get }
    var subscriptions: Set<AnyCancellable> { get }
}
