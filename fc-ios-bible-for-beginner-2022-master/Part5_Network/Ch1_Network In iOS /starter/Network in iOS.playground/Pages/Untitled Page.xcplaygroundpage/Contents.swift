//: [Previous](@previous)

import Foundation

class Job {
    weak var name: Name?

    deinit {
        print("deinit Job")
    }
}

class Name {
    var job: Job?

    deinit {
        print("deinit Name")
    }

}

var a: Job? = Job()
var b: Name? = Name()

//a = nil
//b?.job = nil
//print(b?.job)
//b = nil

//b = nil
//a?.name = b
//
//print(a?.name)
//a =  nil


class Strong {
    weak var strong: Strong? = nil //약한 참조 객체
}

//두개의 객체 변수 선언
var strong1: Strong? = Strong()  //객체 변수
var strong2: Strong? = Strong()  //객체 변수

//서로 강한 참조 (강한 순환 참조)
strong1?.strong = strong2
strong2?.strong = strong1

strong1?.strong = nil
//strong2?.strong = strong1

strong1 = nil

print("strong1 \(strong1)")

print("strong2 \(strong2)")

