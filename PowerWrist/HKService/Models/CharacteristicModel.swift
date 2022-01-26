//
//  CharacteristicModel.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation
import HealthKit

struct CharacteristicModel{
    public let biologicalSex: HKBiologicalSex?
    public let birthday: DateComponents?
    public let bloodType: HKBloodType?
    public let fitzpatrickSkinType: HKFitzpatrickSkinType?
    public let wheelchairUse: HKWheelchairUse?
    public let activityMoveMode: HKActivityMoveMode?
    
    init(
        biologicalSex: HKBiologicalSexObject?,
        bloodType: HKBloodTypeObject?,
        fitzpatrickSkinType: HKFitzpatrickSkinTypeObject?
    ) {
        self.biologicalSex = biologicalSex?.biologicalSex
        self.bloodType = bloodType?.bloodType
        self.fitzpatrickSkinType = fitzpatrickSkinType?.skinType
        self.birthday = nil
        self.wheelchairUse = nil
        self.activityMoveMode = nil
    }
    
    @available(iOS 10.0, *)
    init(
        biologicalSex: HKBiologicalSexObject?,
        birthday: DateComponents?,
        bloodType: HKBloodTypeObject?,
        fitzpatrickSkinType: HKFitzpatrickSkinTypeObject?,
        wheelchairUse: HKWheelchairUseObject?
    ) {
        self.biologicalSex = biologicalSex?.biologicalSex
        self.birthday = birthday
        self.bloodType = bloodType?.bloodType
        self.fitzpatrickSkinType = fitzpatrickSkinType?.skinType
        self.wheelchairUse = wheelchairUse?.wheelchairUse
        self.activityMoveMode = nil
    }
    
    @available(iOS 14.0, *)
    init(
        biologicalSex: HKBiologicalSexObject?,
        birthday: DateComponents?,
        bloodType: HKBloodTypeObject?,
        fitzpatrickSkinType: HKFitzpatrickSkinTypeObject?,
        wheelchairUse: HKWheelchairUseObject?,
        activityMoveMode: HKActivityMoveModeObject?
    ) {
        self.biologicalSex = biologicalSex?.biologicalSex
        self.birthday = birthday
        self.bloodType = bloodType?.bloodType
        self.fitzpatrickSkinType = fitzpatrickSkinType?.skinType
        self.wheelchairUse = wheelchairUse?.wheelchairUse
        self.activityMoveMode = activityMoveMode?.activityMoveMode
    }
}

