//
//  main.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/12/25.
//

import Foundation

// 문제 해석
// 문제 접근

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    
    return dfs(begin: begin, target: target, words: words)
}

func dfs(begin: String, target: String, words: [String]) -> Int {
    
    // 1. target이 work안에 없는 경우
    if !words.contains(target) {
        return 0
    }
    
    var stack: [String] = []
    var set = Set<String>()
    // 2. DFS : target 단어로 가는 후보인가
    var diffCount = 0
    for (c1, c2) in zip(begin, target) {
        if c1 != c2 {
            set.insert(words.filter { })
        }
    }
    print(set)
    
        // 2.1 탐색중, 더이상 알맞은 후보 없는 경우 return 0
    
    return 0
}

let begin = "hit", target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]
let words2 = ["hot", "dot", "dog", "lot", "log"]

//print(solution(begin, target, words))
solution(begin, target, words)
