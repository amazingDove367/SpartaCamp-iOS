//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
// Buit in publisher : Just
// Just : data를 한번 전송하고 끝임
let just = Just(1000) // publisher
let subscription1 = just.sink { value in
    print("Receive Value: \(value)")
}

// array로 여러개의 data 보내기!
// Built in Subscriber : [sink, assign
let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Receive Value: \(value)")
}

// assign
class MyClass {
    var property: Int = 0 {
        didSet { // 값이 설정되면 호출
            print("Did set propery to \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print(object.property)
//object.property = 3


//: [Next](@next)


