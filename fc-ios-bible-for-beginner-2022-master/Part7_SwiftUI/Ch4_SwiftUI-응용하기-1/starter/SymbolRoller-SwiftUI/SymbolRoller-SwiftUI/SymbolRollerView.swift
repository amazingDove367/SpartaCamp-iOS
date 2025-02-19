//
//  ContentView.swift
//  SymbolRoller-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct SymbolRollerView: View {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @State var symbol: String = "moon"
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: symbol)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            Text(symbol)
                .font(.system(size: 40, weight: .bold))
            
            Spacer()
            Button(action: {
                symbol = self.symbols.randomElement()!
            }, label: {
                HStack {
                    Image(systemName: "arrow.3.trianglepath")
                    
                    VStack (alignment: .leading) {
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold))
                        
                        Text("click me to reload")
                            .font(.system(size: 12))
                    }
                }
            })
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .foregroundColor(.white)
//            .cornerRadius(40)
            .clipShape(.capsule)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRollerView()
    }
}
