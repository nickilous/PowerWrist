//
//  HKPermissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation

enum ReadPermissions: CustomStringConvertible, Equatable {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
    case characteristic(CharacteristicType)
    case activitySummary(ActivitySummaryType)
    
    var description: String {
        var descript = "Read Permission: "
        switch self {
        case .quantity(let quantityType):
            descript += " quantity type \(quantityType)"
        case .category(let categoryType):
            descript += " quantity type \(categoryType)"
        case .series(let seriesType):
            descript += " quantity type \(seriesType)"
        case .electroCardioGram(let electrocardiogramType):
            descript += " quantity type \(electrocardiogramType)"
        case .document(let documentType):
            descript += " quantity type \(documentType)"
        case .workout(let workoutType):
            descript += " quantity type \(workoutType)"
        case .correlation(let correlationType):
            descript += " quantity type \(correlationType)"
        case .characteristic(let characteristicType):
            descript += " quantity type \(characteristicType)"
        case .activitySummary(let activitySummaryType):
            descript += " quantity type \(activitySummaryType)"
        }
        return descript
    }
    
    
}
enum WritePermissions: CustomStringConvertible, Equatable {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
    
    var description: String {
        var descript = "Read Permission: "
        switch self {
        case .quantity(let quantityType):
            descript += " quantity type \(quantityType)"
        case .category(let categoryType):
            descript += " quantity type \(categoryType)"
        case .series(let seriesType):
            descript += " quantity type \(seriesType)"
        case .electroCardioGram(let electrocardiogramType):
            descript += " quantity type \(electrocardiogramType)"
        case .document(let documentType):
            descript += " quantity type \(documentType)"
        case .workout(let workoutType):
            descript += " quantity type \(workoutType)"
        case .correlation(let correlationType):
            descript += " quantity type \(correlationType)"
        }
        return descript
    }
}
