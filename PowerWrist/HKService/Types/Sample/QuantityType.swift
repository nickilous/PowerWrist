//
//  QuantityType.swift
//  HealthKitReporter
//
//  Created by Victor on 05.10.20.
//

import Foundation
import HealthKit

/**
 All HealthKit qunatitiy types
 */
public enum QuantityType: Int, CaseIterable, SampleType {
    case bodyMassIndex
    case bodyFatPercentage
    case height
    case bodyMass
    case leanBodyMass
    case waistCircumference
    case stepCount
    case distanceWalkingRunning
    case distanceCycling
    case distanceWheelchair
    case basalEnergyBurned
    case activeEnergyBurned
    case flightsClimbed
    case nikeFuel
    case appleExerciseTime
    case pushCount
    case distanceSwimming
    case swimmingStrokeCount
    case vo2Max
    case distanceDownhillSnowSports
    case appleStandTime
    case walkingSpeed
    case walkingDoubleSupportPercentage
    case walkingAsymmetryPercentage
    case walkingStepLength
    case sixMinuteWalkTestDistance
    case stairAscentSpeed
    case stairDescentSpeed
    case heartRate
    case bodyTemperature
    case basalBodyTemperature
    case bloodPressureSystolic
    case bloodPressureDiastolic
    case respiratoryRate
    case restingHeartRate
    case walkingHeartRateAverage
    case heartRateVariabilitySDNN
    case oxygenSaturation
    case peripheralPerfusionIndex
    case bloodGlucose
    case numberOfTimesFallen
    case electrodermalActivity
    case inhalerUsage
    case insulinDelivery
    case bloodAlcoholContent
    case forcedVitalCapacity
    case forcedExpiratoryVolume1
    case peakExpiratoryFlowRate
    case environmentalAudioExposure
    case headphoneAudioExposure
    case dietaryFatTotal
    case dietaryFatPolyunsaturated
    case dietaryFatMonounsaturated
    case dietaryFatSaturated
    case dietaryCholesterol
    case dietarySodium
    case dietaryCarbohydrates
    case dietaryFiber
    case dietarySugar
    case dietaryEnergyConsumed
    case dietaryProtein
    case dietaryVitaminA
    case dietaryVitaminB6
    case dietaryVitaminB12
    case dietaryVitaminC
    case dietaryVitaminD
    case dietaryVitaminE
    case dietaryVitaminK
    case dietaryCalcium
    case dietaryIron
    case dietaryThiamin
    case dietaryRiboflavin
    case dietaryNiacin
    case dietaryFolate
    case dietaryBiotin
    case dietaryPantothenicAcid
    case dietaryPhosphorus
    case dietaryIodine
    case dietaryMagnesium
    case dietaryZinc
    case dietarySelenium
    case dietaryCopper
    case dietaryManganese
    case dietaryChromium
    case dietaryMolybdenum
    case dietaryChloride
    case dietaryPotassium
    case dietaryCaffeine
    case dietaryWater
    case uvExposure

    public var identifier: String? {
        return hkobject?.identifier
    }
    
    public var hkobject: HKObjectType? {
        sampleType
    }
    public var sampleType: HKSampleType? {
        switch self {
        case .heartRateVariabilitySDNN:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
            } else {
                return nil
            }
        case .bodyMassIndex:
            return HKSampleType.quantityType(forIdentifier: .bodyMassIndex)
        case .bodyFatPercentage:
            return HKSampleType.quantityType(forIdentifier: .bodyFatPercentage)
        case .heartRate:
            return HKSampleType.quantityType(forIdentifier: .heartRate)
        case .respiratoryRate:
            return HKSampleType.quantityType(forIdentifier: .respiratoryRate)
        case .oxygenSaturation:
            return HKSampleType.quantityType(forIdentifier: .oxygenSaturation)
        case .bodyTemperature:
            return HKSampleType.quantityType(forIdentifier: .bodyTemperature)
        case .basalBodyTemperature:
            return HKSampleType.quantityType(forIdentifier: .basalBodyTemperature)
        case .bloodPressureSystolic:
            return HKSampleType.quantityType(forIdentifier: .bloodPressureSystolic)
        case .bloodPressureDiastolic:
            return HKSampleType.quantityType(forIdentifier: .bloodPressureDiastolic)
        case .bloodGlucose:
            return HKSampleType.quantityType(forIdentifier: .bloodGlucose)
        case .height:
            return HKSampleType.quantityType(forIdentifier: .height)
        case .bodyMass:
            return HKSampleType.quantityType(forIdentifier: .bodyMass)
        case .restingHeartRate:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .restingHeartRate)
            } else {
                return nil
            }
        case .vo2Max:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .vo2Max)
            } else {
                return nil
            }
        case .waistCircumference:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .waistCircumference)
            } else {
                return nil
            }
        case .stepCount:
            return HKSampleType.quantityType(forIdentifier: .stepCount)
        case .distanceSwimming:
            if #available(iOS 10.0, *) {
                return HKSampleType.quantityType(forIdentifier: .distanceSwimming)
            } else {
                return nil
            }
        case .distanceWalkingRunning:
            return HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)
        case .distanceCycling:
            return HKSampleType.quantityType(forIdentifier: .distanceCycling)
        case .basalEnergyBurned:
            return HKSampleType.quantityType(forIdentifier: .basalEnergyBurned)
        case .activeEnergyBurned:
            return HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)
        case .flightsClimbed:
            return HKSampleType.quantityType(forIdentifier: .flightsClimbed)
        case .appleExerciseTime:
            if #available(iOS 9.3, *) {
                return HKSampleType.quantityType(forIdentifier: .appleExerciseTime)
            } else {
                return nil
            }
        case .dietaryEnergyConsumed:
            return HKSampleType.quantityType(forIdentifier: .dietaryEnergyConsumed)
        case .dietaryCarbohydrates:
            return HKSampleType.quantityType(forIdentifier: .dietaryCarbohydrates)
        case .dietaryFiber:
            return HKSampleType.quantityType(forIdentifier: .dietaryFiber)
        case .dietarySugar:
            return HKSampleType.quantityType(forIdentifier: .dietarySugar)
        case .dietaryFatTotal:
            return HKSampleType.quantityType(forIdentifier: .dietaryFatTotal)
        case .dietaryFatSaturated:
            return HKSampleType.quantityType(forIdentifier: .dietaryFatSaturated)
        case .dietaryProtein:
            return HKSampleType.quantityType(forIdentifier: .dietaryProtein)
        case .dietaryVitaminA:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminA)
        case .dietaryThiamin:
            return HKSampleType.quantityType(forIdentifier: .dietaryThiamin)
        case .dietaryRiboflavin:
            return HKSampleType.quantityType(forIdentifier: .dietaryRiboflavin)
        case .dietaryNiacin:
            return HKSampleType.quantityType(forIdentifier: .dietaryNiacin)
        case .dietaryPantothenicAcid:
            return HKSampleType.quantityType(forIdentifier: .dietaryPantothenicAcid)
        case .dietaryVitaminB6:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminB6)
        case .dietaryVitaminB12:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminB12)
        case .dietaryVitaminC:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminC)
        case .dietaryVitaminD:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminD)
        case .dietaryVitaminE:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminE)
        case .dietaryVitaminK:
            return HKSampleType.quantityType(forIdentifier: .dietaryVitaminK)
        case .dietaryFolate:
            return HKSampleType.quantityType(forIdentifier: .dietaryFolate)
        case .dietaryCalcium:
            return HKSampleType.quantityType(forIdentifier: .dietaryCalcium)
        case .dietaryIron:
            return HKSampleType.quantityType(forIdentifier: .dietaryIron)
        case .dietaryMagnesium:
            return HKSampleType.quantityType(forIdentifier: .dietaryMagnesium)
        case .dietaryPhosphorus:
            return HKSampleType.quantityType(forIdentifier: .dietaryPhosphorus)
        case .dietaryPotassium:
            return HKSampleType.quantityType(forIdentifier: .dietaryPotassium)
        case .dietarySodium:
            return HKSampleType.quantityType(forIdentifier: .dietarySodium)
        case .dietaryZinc:
            return HKSampleType.quantityType(forIdentifier: .dietaryZinc)
        case .dietaryIodine:
            return HKSampleType.quantityType(forIdentifier: .dietaryIodine)
        case .dietaryManganese:
            return HKSampleType.quantityType(forIdentifier: .dietaryManganese)
        case .dietaryWater:
            return HKSampleType.quantityType(forIdentifier: .dietaryWater)
        case .peakExpiratoryFlowRate:
            return HKSampleType.quantityType(forIdentifier: .peakExpiratoryFlowRate)
        case .leanBodyMass:
            return HKSampleType.quantityType(forIdentifier: .leanBodyMass)
        case .distanceWheelchair:
            if #available(iOS 10.0, *) {
                return HKSampleType.quantityType(forIdentifier: .distanceWheelchair)
            } else {
                return nil
            }
        case .nikeFuel:
            return HKSampleType.quantityType(forIdentifier: .nikeFuel)
        case .pushCount:
            if #available(iOS 10.0, *) {
                return HKSampleType.quantityType(forIdentifier: .pushCount)
            } else {
                return nil
            }
        case .swimmingStrokeCount:
            if #available(iOS 10.0, *) {
                return HKSampleType.quantityType(forIdentifier: .swimmingStrokeCount)
            } else {
                return nil
            }
        case .distanceDownhillSnowSports:
            if #available(iOS 11.2, *) {
                return HKSampleType.quantityType(forIdentifier: .distanceDownhillSnowSports)
            } else {
                return nil
            }
        case .walkingHeartRateAverage:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .walkingHeartRateAverage)
            } else {
                return nil
            }
        case .peripheralPerfusionIndex:
            return HKSampleType.quantityType(forIdentifier: .peripheralPerfusionIndex)
        case .numberOfTimesFallen:
            return HKSampleType.quantityType(forIdentifier: .numberOfTimesFallen)
        case .electrodermalActivity:
            return HKSampleType.quantityType(forIdentifier: .electrodermalActivity)
        case .inhalerUsage:
            return HKSampleType.quantityType(forIdentifier: .inhalerUsage)
        case .insulinDelivery:
            if #available(iOS 11.0, *) {
                return HKSampleType.quantityType(forIdentifier: .insulinDelivery)
            } else {
                return nil
            }
        case .bloodAlcoholContent:
            return HKSampleType.quantityType(forIdentifier: .bloodAlcoholContent)
        case .forcedVitalCapacity:
            return HKSampleType.quantityType(forIdentifier: .forcedVitalCapacity)
        case .forcedExpiratoryVolume1:
            return HKSampleType.quantityType(forIdentifier: .forcedExpiratoryVolume1)
        case .dietaryFatPolyunsaturated:
            return HKSampleType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)
        case .dietaryFatMonounsaturated:
            return HKSampleType.quantityType(forIdentifier: .dietaryFatMonounsaturated)
        case .dietaryCholesterol:
            return HKSampleType.quantityType(forIdentifier: .dietaryCholesterol)
        case .dietaryBiotin:
            return HKSampleType.quantityType(forIdentifier: .dietaryBiotin)
        case .dietarySelenium:
            return HKSampleType.quantityType(forIdentifier: .dietarySelenium)
        case .dietaryCopper:
            return HKSampleType.quantityType(forIdentifier: .dietaryCopper)
        case .dietaryChromium:
            return HKSampleType.quantityType(forIdentifier: .dietaryChromium)
        case .dietaryMolybdenum:
            return HKSampleType.quantityType(forIdentifier: .dietaryMolybdenum)
        case .dietaryChloride:
            return HKSampleType.quantityType(forIdentifier: .dietaryChloride)
        case .dietaryCaffeine:
            return HKSampleType.quantityType(forIdentifier: .dietaryCaffeine)
        case .uvExposure:
            return HKSampleType.quantityType(forIdentifier: .uvExposure)
        case .environmentalAudioExposure:
            if #available(iOS 13.0, *) {
                return HKSampleType.quantityType(forIdentifier: .environmentalAudioExposure)
            } else {
                return nil
            }
        case .headphoneAudioExposure:
            if #available(iOS 13.0, *) {
                return HKSampleType.quantityType(forIdentifier: .headphoneAudioExposure)
            } else {
                return nil
            }
        case .appleStandTime:
            if #available(iOS 13.0, *) {
                return HKSampleType.quantityType(forIdentifier: .appleStandTime)
            } else {
                return nil
            }
        case .walkingSpeed:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .walkingSpeed)
            } else {
                return nil
            }
        case .walkingDoubleSupportPercentage:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .walkingDoubleSupportPercentage)
            } else {
                return nil
            }
        case .walkingAsymmetryPercentage:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .walkingAsymmetryPercentage)
            } else {
                return nil
            }
        case .walkingStepLength:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .walkingStepLength)
            } else {
                return nil
            }
        case .sixMinuteWalkTestDistance:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .sixMinuteWalkTestDistance)
            } else {
                return nil
            }
        case .stairAscentSpeed:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .stairAscentSpeed)
            } else {
                return nil
            }
        case .stairDescentSpeed:
            if #available(iOS 14.0, *) {
                return HKSampleType.quantityType(forIdentifier: .stairDescentSpeed)
            } else {
                return nil
            }
        }
    }
}
