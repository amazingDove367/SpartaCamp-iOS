# ⚾ CLI 야구 게임

0~9 사이의 서로 다른 숫자 3개를 맞추는 간단한 숫자 게임입니다!

## 📌 게임 규칙 (RULES)

1. **0에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다**
	- 첫번째 자리의 숫자는 0 이 될 수 없습니다
2. **정답을 맞추기 위해 3자리 수를 입력하고 힌트를 받습니다**
3. **힌트는 야구 용어인 "볼"과 "스트라이크"입니다**
   - 같은 자리에 같은 숫자가 있는 경우 → `스트라이크`
   - 다른 자리에 숫자가 있는 경우 → `볼`
4. **예제**
   - 정답: `456`
   - 입력: `435` → `1 스트라이크 1 볼`
   - 입력: `357` → `1 스트라이크`
   - 입력: `678` → `1 볼`
   - 입력: `123` → `Nothing`
5. **올바르지 않은 입력값에 대해서는 오류 문구가 출력되고, 재입력을 받습니다.**
6. **3자리 숫자가 정답과 같아지면 게임이 종료됩니다.**

<br>

## 🚀 실행 방법

### 1. 프로젝트 클론
```sh
$ git clone https://github.com/hortenssiaa/SpartaCamp-iOS/tree/main/BaseBallGame_CLI
$ cd BaseballGameCLI
```

### 2. 실행하기
```sh
$ swift main.swift
```
<br>

## 🛠 기술 스택
- MVVM 아키텍처
- ~~Command Pattern~~
## 📂 폴더 구조
```
BaseballGameCLI/
│── BaseballGame/
│   ├── main.swift
│   ├── Command/ (실행불가)
│   │   ├── GameInvoker.swift
│   │   ├── MenuCommand.swift
│   ├── Model/
│   │   ├── Player.swift
│   │   ├── Rules.swift
│   ├── Utils/
│   │   ├── InputHandler.swift
│   │   ├── RandomAnswerGenerator.swift
│   ├── View/
│   │   ├── GameView.swift
│   │   ├── HintView.swift
│   │   ├── Menu.swift
│   ├── ViewModel/
│   │   ├── GameViewModel.swift
│   │   ├── HintViewModel.swift
│── README.md
```

<br>

## 🛠 트러블슈팅 (Troubleshooting)

### 1. `Thread 1: EXC_BAD_ACCESS` 오류 발생 (미해결)  
 > error detail; A bad access to memory terminated the process.
- **의심되는 원인**: `GameInvoker`에서 `GameViewModel`을 선언할 때 순환 참조가 발생하는 것 같음
- **상태**: 미해결되어, Command Pattern 을 제외한 상태임
- **시도한 해결 방법**:
  1. `GameViewModel`의 `GameInvoker`를 `unowned var`로 선언

### 2. `Cannot use instance member 'gameInvoker' within property initializer` 오류 발생 (미해결)
- **의심되는 원인**: 프로퍼티 초기화 시 `self`가 아직 생성되지 않았기 때문
- **상태**: 미해결되어, Command Pattern 을 제외한 상태임
- **시도한 해결 방법**:
  1. `lazy var`를 사용하여 `self`가 완전히 초기화된 후 접근하도록 수정
  
### 3. 랜덤 값이 제대로 생성되지 않는 경우
- `RandomAnswerGenerator`의 `makeAnswer` 메서드에서 랜덤 값 생성 로직 확인
- 추후에 입력받는 자릿수의 숫자가 달라질 것을 대비하여, 자리수에 따라 10의 제곱근으로 랜덤 값을 생성했다.
- swift 에서 사용할 수 없는 `^` 연산자를 사용하여 값이 이상하게 나왔음
- 해결 방법:  `^` 연산자 -> `pow()` 메소드로 변경
- 디버깅 방법: `print()`를 활용하여 입력값과 검증 과정을 출력해보며 문제를 찾기
