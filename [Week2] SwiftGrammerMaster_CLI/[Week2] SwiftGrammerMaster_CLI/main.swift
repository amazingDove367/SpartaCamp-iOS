//
//  main.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/18/25.
//

import Foundation

// 필수 문제 1
// [1.1] 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
var sum: (Int, Int) -> String = { v1, v2 in
    return "두 수의 합은 \(v1 + v2) 입니다"
}

print(sum(4, 1000))

// [1.2] 위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
func calculate(_ a: Int, _ b: Int, closure: (Int, Int) -> String) {
    print(closure(a, b))
}

calculate(10, 23) { a, b in
    return "\(a + b)"
}


// 필수 문제 2
// [2.1] 아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.
let numbers = [1, 2, 3, 4, 5]

var result = [String]()

numbers.map { result.append(String($0)) }


// [2.2] 주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
let intArr: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var strArr = intArr.filter { $0 % 2 == 0 }
    .map { String($0) }

print(strArr)

