//
//  main.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/18/25.
//

import Foundation

// 문제 실행

/// 필수 구현 1
/// [1.1] 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
print("*️⃣ 필수 구현 1.1 *️⃣")
problem1()

/// [1.2] 위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
print("\n*️⃣ 필수 구현 1.2 *️⃣")
runCalculate()



/// 필수 구현 2
/// [2.1] 아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.
print("\n*️⃣ 필수 구현 2.1 *️⃣")
problem2_1()

/// [2.2] 주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
print("\n*️⃣ 필수 구현 2.2 *️⃣")
problem2_2()

/// [2.3] 이제 고차함수를 직접 만들어 봅니다.
print("\n*️⃣ 필수 구현 2.3 *️⃣")
runMyMap()



/// 필수 구현 3
/// [3.1] Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a 를 작성해주세요.
print("\n*️⃣ 필수 구현 3.1 *️⃣")
//runA()

/// [3.2] String 배열의 짝수번째 요소를 제거해서 반환하는 함수 b 를 작성해주세요.
print("\n*️⃣ 필수 구현 3.2 *️⃣")
//runB()

/// [3.3] 위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 c 로 작성해주세요.
print("\n*️⃣ 필수 구현 3.3 *️⃣")
runC()

/// [3.4] 함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
///     파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.
print("\n*️⃣ 필수 구현 3.4 *️⃣")
