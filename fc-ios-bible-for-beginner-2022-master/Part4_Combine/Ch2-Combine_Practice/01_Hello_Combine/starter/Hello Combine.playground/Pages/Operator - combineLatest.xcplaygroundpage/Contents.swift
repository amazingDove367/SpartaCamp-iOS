//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest
// 2개의 publisher 를 같이 받는것
/* ex
 "a",           "b",   "c"
      1,     2   3           5
    (a,1)  (a,2) (b,3) (c,3) (c,5)
 */
let strPublisher = PassthroughSubject<String, Never>()
let intPublisher = PassthroughSubject<Int, Never>()


//Publishers.CombineLatest(strPublisher, intPublisher).sink(receiveValue: <#T##(((String, Int)) -> Void)##(((String, Int)) -> Void)##((String, Int)) -> Void#>)
strPublisher.combineLatest(intPublisher).sink { str, int in
    print("Receive: \(str), \(int)")
}

strPublisher.send("x")
intPublisher.send(1)
strPublisher.send("y")
intPublisher.send(2)
intPublisher.send(3)
strPublisher.send("z")



// Advanced CombineLatest
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validateCredentialSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? \(valid)")
    }

usernamePublisher.send("hakyungsohn")
passwordPublisher.send("weekpw")
passwordPublisher.send("verystrongpassword")


// Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

//Publishers.Merge(publisher1, publisher2).sink { value in print("Merge: subscription received value: \(value)")}
let mergedPublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: subscription received value: \(value)")
    }



//: [Next](@next)
