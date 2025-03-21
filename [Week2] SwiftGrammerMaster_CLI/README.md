# 🦅 Swift Grammar Master CLI

`SwiftGrammerMaster_CLI`는 `Swift의 심화 개념`을 학습하고 CLI 환경에서 `문제를 해결`하는 프로젝트입니다.  

<br>

## 📘 프로젝트 개요
- **주제:** `Swift 심화 문법 학습` 및 `CLI 기반 실습 프로젝트`
- **학습 개념:** `클로저`, `고차함수`, `제네릭`, `프로토콜`, `에러 처리`, `객체지향 설계`

<br>

## 👩🏻‍🏫 구현 가이드

### ✅ 필수 문제 1: 클로저와 함수

- [x] 두 개의 `Int` 값을 파라미터로 받고, 하나의 `String` 값을 반환하는 클로저 설계
    - 내부에서 두 수를 더한 후 `"두 수의 합은 {합계} 입니다"` 형태로 반환
- [x] 해당 클로저를 `sum`이라는 상수에 저장하고, 정확한 타입 명시
- [x] `sum`을 호출하는 코드 작성 (임의의 값으로 호출)
- [x] `sum`과 동일한 타입의 클로저를 파라미터로 받고, 반환값이 `Void`인 함수 `calculate` 작성
    - `calculate` 내부에서 전달받은 클로저를 호출하는 코드 포함

---

### ✅ 필수 문제 2: 고차함수와 map 구현

- [x] `forEach`로 작성된 배열 반복 코드를 `map`으로 변환

```swift
let numbers = [1, 2, 3, 4, 5]
var result = [String]()
// forEach → map으로 변환
for number in numbers {
  result.append(number)
}
```


- [x] 다음 조건을 만족하는 `고차함수 체이닝` 구현
  - 입력: `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`
  - 출력: `["2", "4", "6", "8", "10"]`
- [x] 고차함수 `myMap` 직접 구현
  - 파라미터:
    1. 배열 `[Int]`
    2. 변환 클로저 `(Int) -> String`
  - 반환값: `[String]`
    - 예시
      ```swift
      let result = myMap([1, 2, 3, 4, 5]) {
        String($0)
      }
      print(result) // ["1", "2", "3", "4", "5"]
      ```


---

### ✅ 필수 문제 3: 제네릭과 타입 추상화
- [x] `Int` 배열의 짝수 번째 요소 제거 함수 a 작성
- [x] `String` 배열의 짝수 번째 요소 제거 함수 b 작성
- [x] 위 두 함수를 하나로 대체할 수 있는 제네릭 함수 c 작성
- [x] 테스트 케이스를 통해 c 함수의 동작 확인

```swift
// 입력: [1, 2, 3, 4, 5] → 출력: [1, 3, 5]
// 입력: ["가", "나", "다", "라", "마"] → 출력: ["가", "다", "마"]
```

- [x] `Numeric 프로토콜`을 준수하는 배열을 처리할 수 있는 함수 d 작성



---

### 🔥 도전 문제 1: 자동차 객체지향 설계

- [x] `Car` 클래스 설계
  - 상태: 브랜드, 모델, 연식 (`String`)
  - 엔진: 커스텀 타입 `Engine`
  - 동작: `drive()` (예: "Car 주행 중..." 출력)
  - 선택: `stop()`, `charge()`, `refuel()` 등 추가 동작 가능
- [x] `ElectricCar` 클래스 (`Car` 상속)
  - `ElectricEngine` 타입의 엔진 사용
- [x] `HybridCar` 클래스 (`Car` 상속)
  - `HydrogenEngine` 정의 및 사용
  - 런타임에 엔진을 바꾸는 `switchEngine(to:)` 메서드 포함
- [x] `HybridCar` 인스턴스 생성 및 `switchEngine(to:)` 호출 예제 작성
- [x] 상속과 프로토콜의 차이점과 장단점을 주석으로 설명

<br>

## 📂 폴더 구조
```
[Week2] SwiftGrammerMaster_CLI
│── Problems
│   ├── Problem1.swift            # 문제 1
│   ├── Problem2.swift            # 문제 2
│   ├── Problem3.swift            # 문제 3
│   ├── AdvancedProblem
│   │   ├── Car.swift                 # 기본 자동차 클래스
│   │   ├── ElectricCar.swift         # 전기차 클래스 (Car 상속)
│   │   ├── HybridCar.swift           # 하이브리드 자동차 클래스 (Car 상속)
│   │   ├── Models
│   │   │   ├── CarError.swift        # 자동차 관련 에러 처리
│   │   │   ├── Engine.swift          # 엔진 모델
│── IOHelper.swift                    # 입출력 도우미 함수
│── main.swift                        # 실행 파일 (프로그램 시작점)
│── README.md
```
📌 **폴더 및 파일 설명**
- `Problems/` → **기본 문제 풀이 코드 (`Problem1`, `Problem2`, `Problem3`)**
- `AdvancedProblem/Models/` → **자동차 관련 클래스 및 모델 정의**
- `IOHelper.swift` → **CLI에서 입출력 처리**
- `main.swift` → **프로그램 실행 진입점**



<br>

## 🛠 트러블슈팅 (Troubleshooting)
### 1.제네릭의 잘못된 사용
- **원인**:
  1. 제네릭 함수를 사용하는 컨셉 자체를 잘못 이해함
  2. 명시적 매개변수를 넣어주지 않고, 프롬프트 입력을 받아 Any 타입으로 넘어가면서 컴파일 오류
    
- **상태**: **제네릭 함수 사용 컨벤션  재숙지후 리팩토링 완료**
- **해결 방법**:
  1. 제네릭 타입의 매개변수를 readLine() 으로 받지않고, 명시적인 매개변수를 넣어줬음
  2. 제네릭 함수 매개변수 타입을 String → 제네릭 타입으로 변경


### 2. type(of: ), is 잘못된 사용
- **원인**: type(of: ) 와 is 의 쓰임과 사용방법을 정확히 알지 못해, 혼용하여 사용
- **상태**: **type(of: ), is 개념 재숙지후 리팩토링 완료**
- **해결 방법**: 문제 해결 목적에 맞는, 프로토콜 준수 확인용 is 키워드만 사용

<br>

## vlog 회고 / 자세한 트러블 슈팅
https://hortenssiaa.tistory.com/88
