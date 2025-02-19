//
//  StockRankRow.swift
//  StockRank-SwiftUI
//
//  Created by Hakyung Sohn on 11/5/24.
//

import SwiftUI

struct StockRankRow: View {
    
    var stock: StockModel
//    var stock: StockModel = StockModel.list[0]
    
    var body: some View {
        HStack() {
            Text("\(stock.rank)")
                .foregroundColor(.blue)
                .frame(width: 30)
                .font(.system(size: 16, weight: .bold))
            
            Image(stock.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.trailing, 8.0)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(stock.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(spacing: 16) {
                    Text("\(stock.price) 원")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Text("\(stock.diff, specifier: "%.2f") %")
                        .font(.system(size: 12))
                        .foregroundColor(stock.diff > 0 ? .red : .blue)
                }
            }
            
            Spacer()
            Image(systemName: "heart.fill")
                .font(.system(size: 30))
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    StockRankRow(stock: StockModel.list[0])
}
