//
//  HintViewModel.swift
//  BaseBallGame
//
//  Created by kingj on 3/14/25.
//

import Foundation

class HintViewModel {
    
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
            
            /// Srike & Ball Checker
            for (aswIdx, aswValue) in answer.enumerated() {
                for (inputIdx, inputValue) in input.enumerated() {
                    
                    if aswIdx == inputIdx {
                        if aswValue == inputValue {
                            strike += 1
                        }
                    } else {
                        if aswValue == inputValue {
                            ball += 1
                        }
                    }
                }
            }
            
            /// Hint Message
            return hintMessage(strike: strike, ball: ball)
        }
    }
    
    // MARK: Hint Message
    private func hintMessage(strike: Int, ball: Int) -> Bool {
        let hintUI = Hint(strike: strike, ball: ball)
        
        if strike == 0 && ball == 0 {
            return Hint.nothing()
        } else if strike != 0 && ball == 0   {
            return Hint.strike(strike: strike)
        } else if strike == 0 {
            return Hint.ball(ball: ball)
        } else {
            return Hint.both(strike: strike, ball: ball)
        }
    }
}
