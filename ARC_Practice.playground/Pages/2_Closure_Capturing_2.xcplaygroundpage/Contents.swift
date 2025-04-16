import Foundation

// 1. 캡쳐 (without 캡쳐리스트)
// 캡쳐리스트 쓰지 않으면, 값 타입이더라도 참조가됨 (= rc +1)
func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    
    return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo()) // 2
print(incrementByTwo()) // 4


// 2. 캡쳐리스트 선언
func makeIncrementer_captureList(incrementAmount: Int) -> () -> Int {
    var total = 0
    
    let incrementer: () -> Int = { [total] in
        var total2 = total
        total2 += incrementAmount
        return total2
    }
    
    return incrementer
}

let incrementByTwo_cl = makeIncrementer_captureList(incrementAmount: 2)
print(incrementByTwo_cl()) // 2
print(incrementByTwo_cl()) // 2

// * 값이 모두 0이 나오는 이유?
// - 클로저 캡쳐리스트를 사용하였기 때문에
//   - 캡쳐시점: 클로저가 정의되는 시점에 '값타입'으로 캡쳐
//.  - makeIncrementer_captureList
// - 클로저 캡쳐리스트 사용을 하지 않았기 때문에
//   - 캡쳐시점: 클로저가 실행되는 시점에 '참조타입'으로 캡쳐
//.  - makeIncrementer
