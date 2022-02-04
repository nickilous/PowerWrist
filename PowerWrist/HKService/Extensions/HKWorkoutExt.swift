//
//  HKWorkoutExt.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation
import HealthKit

extension HKWorkout: StartOfDayRepresentable {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: startDate)
    }
}
