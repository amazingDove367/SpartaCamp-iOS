//
//  tutor_code.swift
//  BaseBallGame
//
//  Created by kingj on 3/26/25.
//

import Foundation

final class InputHandler_tutor {
    
    // MARK: [Tutor]
    private func tutor_isValidInput(input: String?) {
        
        print("게임 시작")
        
        let answer = RandomAnswerGenerator.tutor_makeAnswer()
        
        while true {
            guard let input = readLine() else {
                print("입력값 없음")
                continue
            }
            
            let inputArray = input.compactMap { Int(String($0)) }
            
            guard inputArray.count == input.count else {
                print("숫자만 입력하세요")
                continue
            }
            
            guard inputArray.count == 3 else {
                print("숫자 3개만 입력하세요")
                continue
            }
            
            guard Set(inputArray).count == inputArray.count else {
                print("중복 값 존재")
                continue
            }
            
            let hint = tutor_getHint(inputArray: inputArray, answer: answer)
            
            if hint.isSucess == true {
                print("정답입니다!")
            } else if hint.isOut == true {
                print("out입니다")
            } else if hint.strike != 0 {
                print("스트라이크 \(hint.strike) ")
            } else {
                print("볼 \(hint.ball)")
            }
        }
    }
    
    // MARK: [Tutor]
    struct Hint {
        var isSucess: Bool
        var isOut: Bool
        var strike: Int
        var ball: Int
    }
    
    // MARK: [Tutor]
    private func tutor_getHint(inputArray: [Int], answer: [Int]) -> Hint {
        var ball = 0
        var strike = 0
        
        for i in 0 ..< inputArray.count {
            if inputArray[i] == answer[i] {
                strike += 1
            } else if inputArray.contains(answer[i]) {
                ball += 1
            }
        }
        
        return Hint(isSucess: strike == 3, isOut: ball == 0 && strike == 0, strike: strike, ball: ball)
    }
}


class RandomAnswerGenerator_tutor {
    
    /// Random Number Generater
    ///
    /// 1에서 9까지의 '서로 다른 임의의 수' 3자리
    // MARK: [Tutor]
    static func tutor_makeAnswer() -> [Int] {
        var tu_array = Array(1...9)
        tu_array.shuffle()
        return Array(tu_array.prefix(3))
    }
}
