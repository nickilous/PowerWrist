//
//  HKPermissions.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation

enum ReadPermissions {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
    case characteristic(CharacteristicType)
    case activitySummary(ActivitySummaryType)
}
enum WritePermissions {
    case quantity(QuantityType)
    case category(CategoryType)
    case series(SeriesType)
    case electroCardioGram(ElectrocardiogramType)
    case document(DocumentType)
    case workout(WorkoutType)
    case correlation(CorrelationType)
}
