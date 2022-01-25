//
//  HKModel.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/24/22.
//

import Foundation


protocol QuantityModelable {
    var type: QuantityType { get }
}

protocol CharacteristicModelable {
    var type: CharacteristicType { get }
}

protocol ActivitySummaryModelable {
    var type: ActivitySummaryType { get }
}

protocol CategoryModelable {
    var type: CategoryType { get }
}

protocol WorkoutModelable {
    var type: WorkoutType { get }
}
