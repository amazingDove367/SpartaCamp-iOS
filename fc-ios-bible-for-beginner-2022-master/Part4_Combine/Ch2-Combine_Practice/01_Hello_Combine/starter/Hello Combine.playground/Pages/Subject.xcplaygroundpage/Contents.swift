import Foundation
import Combine

// publisher 인데, send() 를 통해, 이벤트값 주입 시킬 수 있음

// PassthroughSubject
let relay = PassthroughSubject<String, Never>() // publisher
let subscription1 = relay.sink { value in  // subscriber
    print("subscription1 received value: \(value)")
}
relay.send("Hello") // send()로 data 가 주어졌을때, passing 하며 보내주는 것
relay.send("World!")



// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("AAA") // output type (String) 에 대한 initial data(초기값)을 넣어줘야함

//variable.send("Initial text") // ** subscription 하기 직전의 DATA!!!!

let subscription2 = variable.sink { value in
    print("*** subscription2 received value: \(value)")
}

// 기존 (초기 or 이전) 값을 버려주고(output) >> 새로운 데이터가 주입되면 그것을 보낸다
//variable.send("More Text")

//variable.value




// 3. 미리 데이터 주어진 경우


let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(variable) // subscriber이 publisher을 subscribe 할 수 있다.
publisher.subscribe(relay)
