//
//  250312_DFS.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/12/25.
//

// 3.12 알고리즘 도전반 (Programmers)
// [DFS_Lv3] 여행경로 
// https://school.programmers.co.kr/learn/courses/30/lessons/43164

import Foundation


class Solution_0312 {
    
    // input ex)
    let tickets = [
        ["ICN", "SFO"],
        ["ICN", "ATL"],
        ["SFO", "ATL"],
        ["ATL", "ICN"],
        ["ATL","SFO"]
    ]
    
    // output ex)
    // ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
    let result: [String] = []
    
    // adj 인접배열 생성
    func makeAdjDict(_ tickets:[[String]]) -> [String: [String]] {
        
        var adjDict: [String: [String]] = [:]
        var adjElements = Set<String>()
        
        // ["ICN", "SFO", "ATL"]
        tickets.forEach {
            adjElements.insert($0[0])
            adjElements.insert($0[1])
        }
        
        // ["SFO": [], "ICN": [], "ATL": []]
        adjElements.forEach {
            adjDict.updateValue([], forKey: $0)
        }
        
        // ["SFO": ["ATL"], "ICN": ["SFO", "ATL"], "ATL": ["SFO", "ICN"]]
        tickets.forEach {
            var temp = adjDict[$0[0]]!
            temp.append($0[1])
            temp.sort(by: { $0 > $1 })
            
            adjDict.updateValue(temp, forKey: $0[0])
        }
        
        return adjDict
    }
    
    
//    let adjDict = makeAdjDict(tickets)
    
    // visit arr
    var visit: [Bool] = [] // [0, 0, 0]
//    for i in 0...adjDict.keys.count - 1 {
//        visit.append(false)
//    }
    
    
    // stack (대기열) arr
    // dfs 재귀함수
    
//    func dfs(element: String) {
//        visit[]
//    }
    
    
    
    
    
    
    
    func solution(_ tickets:[[String]]) -> [String] {
        
        var result: [String] = []
        var start: [String] = []
        
        var arr = tickets.sorted(by: { $0[1] < $1[1] })
        
        var arrcount = tickets.filter({ $0[0].contains("ICN") })
            .sorted(by: { $0[1] < $1[1] })
        
        if arrcount.count > 1 { // 1. 2개 이상
            //        start.append(contentsOf: arrcount[0])
        }
        
        
        
        print(tickets.compactMap { $0[0] })
        print("arrcount : \(arrcount)")
        
        return result
    }
    
    //print(solution(tickets))
    
    
}
