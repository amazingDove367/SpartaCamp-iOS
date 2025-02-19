//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct FrameworkView: View {
    var body: some View {
        
        @State var list: [AppleFramework] = AppleFramework.list
        
        let layout: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        // LayoutVGrid의 columns 에 layout 넘겨주기
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(list) { framework in
                        FrameworkCell(framework: framework)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        
        // Grid View 그리기
        // - UIKit : UICollectionView
        //    - data, layout, presentation
        // - SwiftUI: LazyVGrid (위아래로 스크롤), LazyHGridb (좌우로 스크롤)
        //    - data, layout, presentation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkView()
    }
}
