//
//  StockDetailView.swift
//  StockRank-SwiftUI
//
//  Created by Hakyung Sohn on 11/8/24.
//

import SwiftUI

struct StockDetailView: View {

    @Binding var stock: StockModel

    var body: some View {

        VStack(spacing: 40) {
            Image(stock.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            Text(stock.name)
                .font(.system(size: 24, weight: .bold))
            
            Text("\(stock.price) 원")
                .font(.system(size: 20, weight: .bold))
        }
    }
}

#Preview {
    StockDetailView(stock: .constant(StockModel.list[0]))
        .preferredColorScheme(.dark)
}
