//
//  UserProfileSetting.swift
//  EnvironmentObjTest
//
//  Created by Hakyung Sohn on 11/11/24.
//

import SwiftUI

final class UserProfileSetting: ObservableObject {
    @Published var age: Int = 0
    
    func haveBirthday() {
        age += 1
    }
}
