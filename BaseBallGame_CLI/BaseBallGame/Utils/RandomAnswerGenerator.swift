//
//  RandomAnswerGenerator.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

// MARK: 상수
struct Constants {
    
    /// Input 자리수
    static let digitNumber = 3
}

class RandomAnswerGenerator {
    
    // MARK: Random Number Generater
    /// 1에서 9까지의 '서로 다른 임의의 수' 3자리
    static func makeAnswer() -> Int {
        
        var set = Set<Int>()
        
        while true {
            var answer = 0
            let array = Array((0...9).shuffled().prefix(Constants.digitNumber))
            
            if array.first == 0 {
                continue
            }
            array.forEach { set.insert($0) }
            
            if set.count == Constants.digitNumber { // [1,2,0] -> [0,2,1]
                for (idx, value) in array.reversed().enumerated() {
                    answer += (Int(pow(Float(10), Float(idx))) * value)
                }
                print(answer,
                      " answer")
                return answer
            }
        }
    }
}
