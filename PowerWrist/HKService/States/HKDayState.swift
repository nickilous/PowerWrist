//
//  HKDayState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/31/22.
//

import Foundation
import HealthKit


class DayState<T: StartOfDayRepresentable>: ObservableObject {
    @Published private(set) var days: [Date : [T]] = [:]
    
    init() {
        
    }
    
    func add(item: T) {
        if days.keys.contains(where: { start in
            start == item.startOfDay
        }){
            days[item.startOfDay]?.append(item)
        }else{
            days[item.startOfDay] = [item]
        }
    }
    
    func add(items: [T]){
        for workout in items {
            self.add(item: workout)
        }
    }
}


