import Foundation

// ARC: Automatic Reference Counting
//   - Swift 메모리 관리 시스템
// MRC: Manual Reference Counting
//   - Object-c 메모리 관리 시스템

class MyClass {
    init() {
        print("MyClass 생성")
    }
    
    deinit {
        print("MyClass 소멸")
    }
}

// instance가 메모리를 할당 받음
// Reference Count = 1
var myClass: MyClass? = MyClass()

// 참조자
// : instance를 참조하고 있는 소유자
// Reference Count = 2
var myClass2 = myClass

// Reference Count = 2-1 = 1
myClass = nil

// Reference Count = 1-1 = 0
// 이제서야 deinit 소멸자 실행
myClass2 = nil
