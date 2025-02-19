//
//  FrameDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by Hakyung Sohn on 11/13/24.
//

import SwiftUI

final class FrameDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
