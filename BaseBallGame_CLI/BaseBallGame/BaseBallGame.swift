//
//  BaseBallGame.swift
//  BaseBallGame
//
//  Created by kingj on 3/11/25.
//

import Foundation

class BaseBallGame {
    
    func start() {
        print("< 게임을 시작합니다 >")
        
        // Make Random Answer
        let answer = MakeAnswer()
        
        while true {
            print("숫자를 입력하세요")
            
            // Get & Check Input Value
            let input = readLine()
            if isRightInput(input) {
                if isAnswer(input: input!, answer: String(answer)) {
                    break
                } else {
                    continue
                }
            } else {
                print("올바르지 않은 입력값입니다")
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

    // MARK: Duplicate Number Check
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
    
}
