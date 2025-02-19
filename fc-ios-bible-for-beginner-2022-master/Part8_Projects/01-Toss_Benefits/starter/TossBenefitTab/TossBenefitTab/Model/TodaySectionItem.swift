//
//  TodaySectionItem.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    var benefit: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, benefit]
    }
}

extension TodaySectionItem {
    static let mock = TodaySectionItem(
        point: MyPoint.default,
        benefit: Benefit.today
    )
}
