//
//  BaseBallGame.swift
//  BaseBallGame
//
//  Created by kingj on 3/11/25.
//

import Foundation

class BaseBallGame {
    
    /// Lv4. 5. 6 요구사항
    /// 1). 프로그램을 시작할 때 안내문구
    ///     ✅ 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    /// 2). 1, 2, 3 이외의 입력값에 대해서는 오류 메시지
    ///     ✅ 올바른 숫자를 입력해주세요!
    /// 3). 1. 게임 시작하기
    ///     ✅ 1. “필수 구현 기능” 의 예시처럼 게임이 진행
    ///     ✅ 2. 정답을 맞혀 게임이 종료된 경우
    ///         >  다시 시작 문구
    /// 4). 2. 게임 기록 보기
    ///     ✅ 1. 완료한 게임들에 대해 시도 횟수를 보여줍니다
    ///         > 3. 종료하기 전까지 모두 저장 & 출력
    /// 5). 3. 종료하기
    ///     ✅ 1. 이전의 게임 기록들 초기화



    private var history = [Int]() // 게임 기록
    private var playCounter = 0
    
    func opening() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        var endGame = false
        while !endGame {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            if let input = Int(readLine()!) {
                
                switch input {
                case 1:
                    startGame()
                    
                case 2:
                    showPlayHistory()
                    
                case 3:
                    endTheGame()
                    endGame = true
                    break
                    
                default:
                    print("올바른 숫자를 입력해주세요!")
                }
                
            } else {
                print("올바른 숫자를 입력해주세요!")
            }
            
            print()
        }
        
    }
    
    func startGame() {
        
        print("\n< 게임을 시작합니다 >")
        
        
        // Make Random Answer
        let answer = MakeAnswer()
        
        while true {
            print("숫자를 입력하세요")
            
            // Get & Check Input Value
            let input = readLine()
            if isRightInput(input) {
                
                playCounterUp()
                if isAnswer(input: input!, answer: String(answer)) {
                    // 정답 > 기록 추가
                    updateHistory(playCounter: getPlayCounter())
                    break
                } else {
                    continue
                }
            } else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
        }
    }
    
    func isAnswer(input: String, answer: String) -> Bool {
        return hintGenerator(input: input, answer: answer)
    }
    
    // MARK: Generate Hint
    /// Output 1. 스트라이크/볼
    /// Output 2. Nothing
    func hintGenerator(input: String, answer: String) -> Bool {
        if input == answer {
            print("정답입니다!\n")
            return true
            
        } else {
            var ball = 0
            var strike = 0
            
            // Srike & Ball Checker
            for i in 0...(answer.count - 1) {
                for j in 0...(input.count - 1) {
                    let answerIdx = answer.index(answer.startIndex, offsetBy: i)
                    let inputIdx = input.index(input.startIndex, offsetBy: j)
                    
                    if i == j {
                        if answer[answerIdx] == input[inputIdx] {
                            strike += 1
                        }
                    } else {
                        if answer[answerIdx] == input[inputIdx] {
                            ball += 1
                        }
                    }
                }
            }
            
            // Hint
            if ball == 0 && strike == 0 {
                print("Nothing\n")
                return false
            } else if ball == 0 && strike != 0 {
                print("\(strike)스트라이크\n")
                return false
            } else if ball != 0 && strike == 0 {
                print("\(ball)볼\n")
                return false
            } else { // ball != 0 && strike != 0
                print("\(strike)스트라이크 \(ball)볼\n")
                return false
            }
        }
    }
    
    // MARK: Check Input Value
    /// 1. 중복 숫자 & 숫자 아닌 값 -> 에러 내보내기
    /// 2. 힌트 내보내기
    func isRightInput(_ input: String?) -> Bool {
        
        guard let inputToString = input else { return false }
        
        if let number = Int(inputToString) {
            if 99 < number && number < 1000 {
                if isDuplicateNumber(number: number) {
                    return true
                } else { // 중복된 숫자 (false)
                    return false
                }
            } else { // 3자리 x (false)
                return false
            }
        } else { // 숫자 아닌 값 (false)
            return false
        }
    }

    // MARK: Check Duplicate Number
    /// 중복 숫자 체크
    func isDuplicateNumber(number: Int) -> Bool {
        let number100 = number / 100
        let number10 = (number % 100) / 10
        let number1 = (number % 100) % 10
        return (number100 != number10) && (number10 != number1) && (number100 != number1)
    }
    
    // MARK: Random Number Generater
    /// 1에서 9까지의 '서로 다른 임의의 수' 3자리
    func MakeAnswer() -> Int {
        while true {
            let random100 = Int.random(in: 1...9)
            let random10 = Int.random(in: 0...9)
            let random1 = Int.random(in: 0...9)
            
            if (random100 != random10) && (random10 != random1) && (random100 != random1) {
                return (100 * random100) + (10 * random10) + (1 * random1)
            }
        }
    }

    func playCounterUp() {
        self.playCounter += 1
    }
    
    func getPlayCounter() -> Int {
        return self.playCounter
    }
    
    func updateHistory(playCounter: Int) {
        self.history.append(playCounter)
        clearPlayCounter()
    }
    
    func endTheGame() {
        print("\n< 숫자 야구 게임을 종료합니다 >")
    }
    
    func clearPlayCounter() {
        self.playCounter = 0
    }
    
    func showPlayHistory() {
        print("\n< 게임 기록 보기 >")
        
        if self.history.count > 0 {
            for i in 0...self.history.count - 1 {
                print("\(i + 1)번째 게임 : 시도 횟수 - \(self.history[i])")
            }
        } else {
            print("아직 게임 기록이 없습니다!")
        }
    }
}
