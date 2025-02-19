//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct StockRankView: View {
    
    @State var stockList: [StockModel] = StockModel.list
    
    var body: some View {
        // StockRankRow(셀) 를 재사용할 수 있는 방법: List
        // List와 ForEach의 구현 방식은 비슷
        // List 만들기
        //   1. 각 셀(cell) 을 어떻게 만들것인가
        //   2. 리스트 넣어주기
        List(stockList) { stock in
            StockRankRow(stock: stock)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(height: 80)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .background(.black)
        
//        ScrollView {
//            VStack {
//                ForEach(stockList) { stock in
//                    StockRankRow(stock: stock)
//                        .frame(height: 80)
//                }
//            }
//        }
//        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}
