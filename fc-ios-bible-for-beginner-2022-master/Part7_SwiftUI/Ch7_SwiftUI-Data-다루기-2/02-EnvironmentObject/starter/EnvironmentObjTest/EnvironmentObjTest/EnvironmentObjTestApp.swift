//
//  EnvironmentObjTestApp.swift
//  EnvironmentObjTest
//
//  Created by joonwon lee on 2022/06/12.
//

import SwiftUI

@main
struct EnvironmentObjTestApp: App {
    
    @StateObject var userProfile = UserProfileSetting()
    
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environmentObject(userProfile) // FirstView 에서 부터, userProfile 데이터가 전달 된다.
        }
    }
}
