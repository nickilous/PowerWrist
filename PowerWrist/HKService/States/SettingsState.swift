//
//  SettingsState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 2/4/22.
//

import Foundation
import HealthKit
import Combine

class SettingsState: ObservableObject {
    
    enum Action {
        case update
    }
    
    enum MetricType: CaseIterable, CustomStringConvertible, Identifiable {
        case metric
        case imperial
        
        var description: String {
            switch self {
            case .metric:
                return "Metric"
            case .imperial:
                return "Imperial"
            }
        }
        var distance: UnitLength {
            switch self {
            case .metric:
                return UnitLength.kilometers
            case .imperial:
                return UnitLength.miles
            }
        }
        var weight: UnitMass {
            switch self {
            case .metric:
                return UnitMass.kilograms
            case .imperial:
                return UnitMass.pounds
            }
        }
        var id: String {
            return description
        }
    }
    
    enum HKMetricType {
        case metric
        case imperial
        
        var description: String {
            switch self {
            case .metric:
                return "Metric"
            case .imperial:
                return "Imperial"
            }
        }
        var distance: HKUnit {
            switch self {
            case .metric:
                return HKUnit.meterUnit(with: .kilo)
            case .imperial:
                return HKUnit.mile()
            }
        }
        var id: String {
            return description
        }
    }
    var subject: PassthroughSubject<Action, Never> = .init()
    
    var bodyMassSubject: PassthroughSubject<Double, Never> = .init()
    
    @Published var measurement: MetricType = .imperial
    
    var subscriptions: Set<AnyCancellable> = .init()
    
    init(){
        subject.sink { [weak self] _ in
            self?.bodyMassSubject.send(Double.random(in: 0.0 ... 100 ))
        }.store(in: &subscriptions)
    }
    
    var bodyMassPub: AnyPublisher<Measurement<UnitMass>, Never> {
        return bodyMassSubject
            .eraseToAnyPublisher()
            .print()
            .map { [weak self] value in
                Measurement(value: value, unit: (self?.measurement.weight)!)
            }.eraseToAnyPublisher()
    }
}
