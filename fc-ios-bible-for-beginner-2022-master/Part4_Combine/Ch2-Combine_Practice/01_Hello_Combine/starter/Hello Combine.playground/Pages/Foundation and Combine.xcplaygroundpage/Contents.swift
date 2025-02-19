//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator
struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { (data, response) in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())



// Notifications
let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription = notiPublisher.sink { _ in
    print("Received Notification")
}

center.post(name: noti, object: nil)
center.post(name: noti, object: nil)
center.post(name: noti, object: nil)
subscription.cancel()



// KeyPath binding to NSObject instances
let lable = UILabel()
print("lable text: \(lable.text)")

Just(28)
    .map { "My Age is \($0)" }
    .assign(to: \.text, on: lable)


print("lable text: \(lable.text)")


// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

let timerSubscription = timerPublisher.sink { time in
    print("time: \(time)")
}

// 초반의 5초 후에 해당구문 실행
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    timerSubscription.cancel()
}

//: [Next](@next)
