import Foundation

class Hakyung {
    let mbti = "ISFP"
    init() {
        print("Class 생성")
    }
    
    deinit {
        print("Class 소멸")
    }
}

// hakyung rc = 1
var hakyung: Hakyung? = Hakyung()

// Closure
// closure에서 외부 값을 캡쳐할때, 클래스 인스턴스를 캡쳐하면
// 캡쳐한 인스턴스의 rc + 1한다.
// hakyung rc = 2
//  - 해결: 클로저 캡쳐를 약하게 참조
let printMbti: () -> () = { [weak hakyung] in
    guard let hakyung else { return }
    print("Hakyung's MBTI: \(hakyung.mbti)")
}

printMbti()

// deinit이 불리지 않음
// rc = 2-1 = 1
//  - 해결: 클로저 캡쳐를 약하게 참조
//  - rc = 1-1 = 0
//  - deinit이 불림
hakyung = nil
