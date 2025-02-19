//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by Hakyung Sohn on 12/26/24.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
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
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:] // sequence -> dictionary 가공
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        // given:  "2022-5", "2022-4", "2022-6"
        // sorted: "2022-4", "2022-5", "2022-6"
        return dic.keys.sorted { $0 < $1 } // 오름차순
    }
}
