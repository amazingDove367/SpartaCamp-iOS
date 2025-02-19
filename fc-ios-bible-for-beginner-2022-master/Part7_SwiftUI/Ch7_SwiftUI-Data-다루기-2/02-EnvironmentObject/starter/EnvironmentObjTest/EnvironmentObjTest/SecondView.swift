//
//  SecondView.swift
//  EnvironmentObjTest
//
//  Created by Hakyung Sohn on 11/11/24.
//

import SwiftUI

struct SecondView: View {

    var body: some View {
        VStack {
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }
        }
        .navigationTitle("Second View")
    }
}

#Preview {
    SecondView()
}
