//
//  CharacteristicState.swift
//  PowerWrist
//
//  Created by Nicholas Hartman on 1/25/22.
//

import Foundation


class HKCharacteristicState: ObservableObject, HKCharacteristicControllable {
    var container: HKCharacteristicContainerable
    
    var readPermissions: [ReadPermissions] = [.characteristic(.biologicalSex), .characteristic(.dateOfBirth)]
    
    @Published var characteristics: CharacteristicModel
    
    init(container: HKCharacteristicContainerable){
        self.container = container
        self.characteristics = container.characteristics()
    }
    
    func updateCharacteristics () {
        characteristics = container.characteristics()
        
    }
}
