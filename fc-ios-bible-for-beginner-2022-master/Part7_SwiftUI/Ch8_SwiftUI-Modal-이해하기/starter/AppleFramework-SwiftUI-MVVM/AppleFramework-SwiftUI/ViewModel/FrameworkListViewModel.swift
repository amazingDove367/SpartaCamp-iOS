//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by Hakyung Sohn on 11/12/24.
//

import SwiftUI

final class FrameworkListViewModel: ObservableObject {
    @Published var list: [AppleFramework] = AppleFramework.list
    @Published var isPresented: Bool = false {
        didSet {
            print(">>>> isPresented : \(isPresented)")
        }
    }
    @Published var selectedItem: AppleFramework?
}
