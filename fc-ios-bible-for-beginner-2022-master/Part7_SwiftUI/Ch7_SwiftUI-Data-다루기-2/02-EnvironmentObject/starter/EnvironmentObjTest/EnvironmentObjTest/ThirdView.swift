//
//  ThirdView.swift
//  EnvironmentObjTest
//
//  Created by Hakyung Sohn on 11/11/24.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSetting
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Current Age: \(userProfile.age)")
            Text("Third View")
            Button {
                userProfile.haveBirthday()
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    ThirdView()
        .environmentObject(UserProfileSetting())
}
