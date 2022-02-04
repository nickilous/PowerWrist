//
//  WorkoutState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation
import HealthKit


class WorkoutState: ObservableObject {
    @Published var workouts: [HKWorkout] = []
}
