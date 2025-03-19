//
//  Problem3.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/19/25.
//

import Foundation

/// 필수 문제 3

/// [3.1] Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a 를 작성해주세요.

func a(_ arrayString: String) -> [Int] {
    
    // String to [Int]
    let array = arrayString.filter { $0.isNumber || $0 == "," }
        .split(separator: ",")
        .compactMap { Int($0) }
    
    // Remove Even Elements
    let evenArray = array.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map { $0.element }
    
    return evenArray
}

func runA() {
    let array = readInput(prompt: "배열 입력:") // ex) [1, 2, 3, 4, 5]
    print(a(array))
}

