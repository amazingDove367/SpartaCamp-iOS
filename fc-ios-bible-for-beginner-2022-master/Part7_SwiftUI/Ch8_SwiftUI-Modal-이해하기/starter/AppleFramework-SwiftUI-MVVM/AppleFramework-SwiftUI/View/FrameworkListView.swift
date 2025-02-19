//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach($viewModel.list) { $item in
                        FrameworkCell(framework: $item)
                            .onTapGesture { // 해당 cell 이 터치가 되었을때 수행하라
                                viewModel.isPresented = true
                                viewModel.selectedItem = item
                            }
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        // modal
        
        .sheet(isPresented: $viewModel.isPresented) { // model view 로 띄우기 위해서는, isPresented 의 값을 따른다.
//            EmptyView() // Modal view 로 띄울 view 이름
            let viewModel = FrameDetailViewModel(framework: self.viewModel.selectedItem!)
            FrameDetailView(viewModel: viewModel)
        }
//        .fullScreenCover(isPresented: $viewModel.isPresented) {
//            FrameDetailView(framework: $viewModel.selectedItem)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
            .preferredColorScheme(.dark)
    }
}
