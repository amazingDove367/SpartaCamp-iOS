//
//  250325_Hash.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/25/25.
//

import Foundation

// TODO: 영어 단어장 만들기 (Hash)
// 1. 단어장 단어 우선순위
//   1 자주 나오는 단어일수록 앞에 배치
//   2 단어의 길이가 길수록 앞에 배치
//   3 알파벳 사전 순으로 앞에 있는 단어일수록 앞에 배치
// 2. N: 단어의 갯수, M: 단어 길이 기준
//.  - M 이상인 단어들만 외운다
// 3. 제한 사항
//.  - 알파벳 소문자로만
//.  - 단어의 길이는 10을 넘지 않는다.

func solution_0325() {
    
    var N = 0, M = 0
    if let input = readLine() {
        let array = input.components(separatedBy: " ")
            .compactMap { Int($0) }
        
        N = array[0]
        M = array[1]
    }
    
    var words: [String: Int] = [:]
    for _ in 0..<N {
        if let word = readLine() {
            if M <= word.count && word.count <= 10 {
                words[word, default: 0] += 1
            }
        }
    }
    
    var result =  words.sorted {
        
        //   1 자주 나오는 단어일수록 앞에 배치
        if $0.value != $1.value {
            return $0.value > $1.value
        }
        
        //   2 단어의 길이가 길수록 앞에 배치
        if $0.key.count != $1.key.count {
            return $0.key.count > $1.key.count
        } else {
            //   3 알파벳 사전 순으로 앞에 있는 단어일수록 앞에 배치
            return $0.key < $1.key
            
        }
    }
    
    for array in result {
        print(array.key)
    }
}
