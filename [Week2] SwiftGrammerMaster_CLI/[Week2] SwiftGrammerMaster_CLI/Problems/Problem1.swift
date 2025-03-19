//
//  Problem1.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/19/25.
//

import Foundation

// 필수 문제 1

// [1.1] 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.

func problem1() {
    var sum: (Int, Int) -> String = { v1, v2 in
        return "두 수의 합은 \(v1 + v2) 입니다"
    }
    
    print(sum(4, 1000))
}

// [1.2] 위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.

func calculate(_ a: Int, _ b: Int, closure: (Int, Int) -> String) {
    print(closure(a, b))
}

func runCalculate() {
    calculate(10, 23) { a, b in
        return "\(a + b)"
    }
}

