//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>() // subscription 여러개를 담을 수 있는 통

// removeDuplicates
// 받은 데이터 중, 중복되는 데이터 삭제
let word = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

word
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// compactMap
// map 등으로 transform 한 데이터 중, nil인 데이터는 삭제하고 데이터 보내게 하는 역할
let strings = ["a", "1.23", "3", "def", "0.22", "66"].publisher

strings
    .compactMap { Float($0) } // nil을 제외한, 제대로 변형된 데이터만 배출 (optional하지 않게 배출)
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// ignoreOutput
// 구독은 했지만, 새로 들어오는 데이터에 대해, 더이상 신경쓰고 싶지 않을때

// ex) 10_000개의 데이터가 들어올 예정이지만, 무시할 예정
// 받을 필요 없는 경우
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)



// prefix
// 여러개의 데이터를 받을때, 앞의 n개만 받겠다
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)




//: [Next](@next)
