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

// [1.2] 위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
func calculate(closure: (Int, Int) -> String) {
    print(closure(10, 23))
}

calculate { v1, v2 in
    "두 수의 합은 \(v1 + v2) 입니다"
}


// 필수 문제 2
// [2.1] 아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.
let numbers = [1, 2, 3, 4, 5]

var result = [String]()

numbers.map { result.append(String($0)) }
