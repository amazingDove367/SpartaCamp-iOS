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

## 🕹️ 메뉴
게임을 시작하면 아래와 같은 메뉴가 표시됩니다.

1. 게임 시작하기
2. 게임 기록 보기
3. 종료하기
4. 게임 규칙 보기



## 🛠 기술 스택
- **MVVM 아키텍처** 

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


## 🛠 트러블슈팅 (Troubleshooting)
