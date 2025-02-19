//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let intPublisher = PassthroughSubject<Int, Never>()
let subscription1 = intPublisher
    .map { $0 * 2 }
    .sink { value in
        print("value: \(value)")
    }

intPublisher.send(10)
intPublisher.send(20)
intPublisher.send(30)
subscription1.cancel()

// Filter
let strPublisher = PassthroughSubject<String, Never>()
let subscription2 = strPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Filtered value: \(value)")
    }

strPublisher.send("abc")
strPublisher.send("hakyung")
strPublisher.send("pei")
strPublisher.send("jason")
strPublisher.send("jack")
strPublisher.send("joon")
subscription2.cancel()


//: [Next](@next)
