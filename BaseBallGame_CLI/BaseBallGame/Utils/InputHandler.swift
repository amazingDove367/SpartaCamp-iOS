//
//  InputHandler.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

final class InputHandler {
    
    // MARK: Check Input Validity
    /// 1. 중복 숫자 & 숫자 아닌 값 -> 에러 내보내기
    /// 2. 힌트 내보내기
    static func isValidInput(input: String?) -> Bool {
        
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
    static func isDuplicateNumber(number: Int) -> Bool {
        let number100 = number / 100
        let number10 = (number % 100) / 10
        let number1 = (number % 100) % 10
        return (number100 != number10) && (number10 != number1) && (number100 != number1)
    }
    
    
    // MARK: UI - Wrong Input
    static func requestInputUI() {
        print("숫자를 입력하세요")
    }
    
    
    // MARK: UI - Wrong Input
    static func wrongInputUI() {
        print("올바르지 않은 입력값입니다\n")
    }
    
}
