//
//  FrameworkListViewModel.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 10/28/24.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    init(items: [AppleFramework], selectecItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectecItem)
    }
    
    // Data => Output
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    // User Action => Input
    func didSelect(at indexPath: IndexPath) {
        let framework = items.value[indexPath.item]
        
        selectedItem.send(framework)
    }
}
 
