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



/// [3.2] String 배열의 짝수번째 요소를 제거해서 반환하는 함수 b 를 작성해주세요.

func b(_ arrayString: String) -> [String] {
    
    // String to [String]
    let array = arrayString.filter { $0.isLetter || $0 == "," }
        .split(separator: ",")
        .compactMap { String($0) }
    
    
    let evenArray = array.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map { $0.element }
    
    return evenArray
}

func runB() {
    let array = readInput(prompt: "배열 입력:") // ex) [”가”, “나”, “다”, “라”, “마”]
    print(b(array))
}



/// [3.3] 위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 c 로 작성해주세요.
///      테스트 입력들을 넣고 호출하여 출력이 제대로 나오는지 작성해주세요.

func c<T>(_ array: [T]) -> [T] {
    
    let evenArray = array.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map { $0.element }
    
    return evenArray
}

func runC() {
    let intArray = [1, 2, 3, 4, 5]
    print("\(intArray) -> \(c(intArray))")
    
    let strArray = ["가", "나", "다", "라", "마"]
    print("\(strArray) -> \(c(strArray))")
}



/// [3.4] 함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
///     파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.

func d<T: Numeric>(_ array: [T]) -> [T] {

    let evenArray = array.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map { $0.element }
    
    checkNumericProtocol(evenArray)
    
    return evenArray
}

func runD() {
    let intArray = [1, 2, 3, 4, 5]
    print("\(intArray) -> \(d(intArray))")
}

/// checkNumericProtocol
/// - 제네릭 T 가 프로토콜 Numeric 을 준수하는지 체크하는 함수
func checkNumericProtocol<T>(_ array: [T]) {
    
    if array.allSatisfy({ $0 is (any Numeric) }) {
        print("\(array) conforms to Numeric")
    } else {
        print("\(array) NOT conforms to Numeric")
    }
}
