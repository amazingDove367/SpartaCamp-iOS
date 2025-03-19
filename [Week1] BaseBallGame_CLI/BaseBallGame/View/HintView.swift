//
//  HintView.swift
//  BaseBallGame
//
//  Created by kingj on 3/14/25.
//

import Foundation

struct Hint {
    let strike: Int
    let ball: Int
    
    static func nothing() -> Bool {
        print("[HINT] Nothing\n")
        return false
    }
    
    static func strike(strike: Int) -> Bool {
        print("[HINT] \(strike)스트라이크\n")
        return false
    }

    static func ball(ball: Int) -> Bool {
        print("[HINT] \(ball)볼\n")
        return false
    }

    static func both(strike: Int, ball: Int) -> Bool {
        print("[HINT] \(strike)스트라이크 \(ball)볼\n")
        return false
    }

    
}
