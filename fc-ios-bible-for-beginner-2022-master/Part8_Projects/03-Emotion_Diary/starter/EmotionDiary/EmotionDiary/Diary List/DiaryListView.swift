//
//  ContentView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryListView: View {
    
    // 원하는 것
    // Sequence(배열) -> Dictionary
    //
    // AS-IS
    // [MoodDiary]
    //
    // -> view-model 로 만들기
    //
    // TO-BE
    // [String: [MoodDiary]]
    // "2022-04" : [MoodDiary]
    // "2022-05" : [MoodDiary]
    // "2022-06" : [MoodDiary]
    // "2022-07" : [MoodDiary]
    
    @StateObject var vm: DiaryListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(vm.keys, id: \.self) { key in
                Section {
                    let items = vm.dic[key] ?? []
                    let orderedItems = items.sorted { $0.date < $1.date }
                    
                    ForEach(orderedItems) { item in
                        MoodDiaryCell(diary: item)
                            .frame(height: 50)
                    }
                } header: {
                    Text(key)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}
