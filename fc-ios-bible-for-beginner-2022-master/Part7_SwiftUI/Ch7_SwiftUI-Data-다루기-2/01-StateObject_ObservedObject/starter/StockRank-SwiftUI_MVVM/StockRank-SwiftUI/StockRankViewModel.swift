//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by Hakyung Sohn on 11/8/24.
//

import SwiftUI

final class StockRankViewModel: ObservableObject {

    @Published var list: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favorites = list.filter { $0.isFavorite }
        return favorites.count
    }
}
