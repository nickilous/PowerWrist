//
//  DocumentType.swift
//  HealthKitReporter
//
//  Created by Victor on 05.10.20.
//

import Foundation
import HealthKit

/**
 All HealthKit document types
 */
public enum DocumentType: Int, CaseIterable, SampleType {
    case cda

    public var identifier: String? {
        return hkobject?.identifier
    }
    
    public var sampleType: HKSampleType? {
        return hkobject as? HKSampleType
    }
    
    public var hkobject: HKObjectType? {
        switch self {
        case .cda:
            if #available(iOS 10.0, *) {
                return HKObjectType.documentType(forIdentifier: .CDA)
            } else {
                return nil
            }
        }
    }
}
