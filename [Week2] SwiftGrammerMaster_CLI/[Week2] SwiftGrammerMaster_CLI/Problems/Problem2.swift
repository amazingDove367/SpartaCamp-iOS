//
//  Problem2.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/19/25.
//

import Foundation

// 필수 문제 2

// [2.1] 아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.

func problem2_1() {
    let numbers = [1, 2, 3, 4, 5]
    
    var result = [String]()
    result = numbers.map { String($0) }
    
    print(result)
}


// [2.2] 주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.

func problem2_2() {
    let intArr: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var strArr = intArr.filter { $0 % 2 == 0 }
        .map { String($0) }
    
    print(strArr)
}


// [2.3] 이제 고차함수를 직접 만들어 봅니다.

func myMap(array: [Int], converter: (Int) -> String) -> [String] {
    return array.map { converter($0) }
}

func runMyMap() {
    let arr = myMap(array: [1, 2, 3, 4, 5]) {
        String($0) // 원하는 고차함수 기능
    }
    print(arr)    
}



