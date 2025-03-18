//
//  main.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/18/25.
//

import Foundation

// 필수 문제 1
// [1.1] 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
var sum: (Int, Int) -> String = { (v1: Int, v2: Int) in
    return "두 수의 합은 \(v1 + v2) 입니다"
}

print(sum(4, 1000))
