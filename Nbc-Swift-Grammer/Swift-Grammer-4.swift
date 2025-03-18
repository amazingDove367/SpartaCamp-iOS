
// Day 4
// 1. Closure

import Foundation

// 1.1 Escaping Closure

// [1] escaping closure 실습하기

func performAfterDelay(seconds: Double, closure: @escaping (Double) -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        closure(seconds)
    }
}

performAfterDelay(seconds: 3.0) { seconds in
    print("\(seconds)초 후에 실행됨")
}



// [2.1]  클로저 캡처 실습하기 - Reference Type 캡쳐
// ⭐️ struct 가 Value Type 인데도, 클로저캡쳐에서는, Reference Type 캡쳐를 한다. ⭐️
// WHY? >>>> 기본적으로, 클로저캡쳐는 "Reference Type"으로 한다.

struct Person {
    var name: String
    var age: Int
}

func captureText() {
    var person = Person(name: "John", age: 30)
    
    var closure = { // Reference Type 캡쳐
        print("age: \(person.age)")
    }
    
    closure()
    person.age = 35
    closure()
}

captureText()



// [2.2]  클로저 캡처 실습하기 - Value Type 캡쳐
// ⭐️ [변수/상수] 작성 ⭐️
// [(default == strong)] -> [ weak/unowend ] 작성하여 메모리 누수 방지!
func valueTypeCapture() {
    var person = Person(name: "Peter", age: 31)
    var text = "test Test"
    
    var closure = { [person] in // ⭐️ [] 사용시 value type캡쳐
        print("[c1] age: \(person.age)") // [] 대괄호 안에 들어있는 [person] 만 Value Type캡쳐!
        print("[c1] text: \(text)") // text 는 Reference Type캡쳐
    }
    
    closure()
    // [c1] age: 31
    // [c1] text: test Test
    
    person.age = 40
    text = "[c1_Edited] text"
    
    closure()
    // [c1] age: 31
    // [c1] text: [c1_Edited] text // ⭐️ text: Reference type capture -> 값 바뀜!
    
    var closure2 = { [person, text] in // ⭐️
        print("[c2] age: \(person.age)") // [] 대괄호 안에 들어있는 [person] 만 Value Type캡쳐!
        print("[c2] text: \(text)") // text 는 Reference Type캡쳐
    }
    
    closure2()
    // [c2] age: 40
    // [c2] text: [c1_Edited] text
    
    person.age = 20
    text = "[c2_Edited] text"
    
    closure2()
    // [c2] age: 40
    // [c2] text: [c1_Edited] text // ⭐️ text: Value type capture -> 값 안바뀜
    
}

valueTypeCapture()



// [3] 캡처리스트 실습하기
// - person 을 value type 캡처를 사용해서 테스트 해보세요.
// - Person을 class로 변경한 뒤 weak, unowned 를 사용하여 person을 캡처해보세요.

class PersonClosureTest {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func classValueTypeCaptureTest() {
    var person = PersonClosureTest(name: "Dove", age: 20)
    var text = "test text"
    
    // ⭐️ weak 쓰는 경우; 값이 nil 허용 -> Optional로 리턴
    // ⭐️ unowned 쓰는 경우; 값이 nil 허용 X -> 값 그대로 리턴
    var closure = { [weak person, text] in
        print("age: \(person?.age)")
        print("text: \(text)")
    }
    
    closure()
    // age: Optional(20)
    // text: test text //
    
    person.age = 29
    text = "Edited@@@@"
    
    closure()
    // age: Optional(29)
    // text: test text
    
}

classValueTypeCaptureTest()
