//
//  250324_Heap.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/24/25.
//

import Foundation

// TODO:
// 1. 입력받은 명령어 실행
//   - I 숫자: 큐에 주어진 숫자를 삽입
//   - D 1: 큐에서 최댓값을 삭제
//   - D -1: 큐에서 최솟값을 삭제
// 2. return
//   - 모든 연산을 처리한 후 큐가 비어있으면: [0,0]
//   - 비어있지 않으면: [최댓값, 최솟값]
// 3. 제한사항
//   - 빈 큐에 데이터를 삭제하라는 연산이 주어질 경우, 해당 연산은 무시
//   - 최댓값/최솟값이 둘 이상인 경우, 하나만 삭제

func solution(_ operations:[String]) -> [Int] {
    
    var priorityQueue: [Int] = []
    
    for (_, command) in operations.enumerated() {
        
        // 1. 입력받은 명령어 실행
        if command.hasPrefix("I") { // I 숫자: 큐에 주어진 숫자를 삽입
            if let number = Int(command.components(separatedBy: ["I", " "]).joined()) {
                priorityQueue.append(number)
            }
        } else {
            if !priorityQueue.isEmpty {
                
                // priorityQueue count가 1인 경우
                // 최댓값/최솟값을 삭제하는 연산하지 않고 바로 pop
                if priorityQueue.count == 1 {
                    priorityQueue.removeLast()
                    continue
                }
                
                if command == "D 1" {
                    // D 1: 큐에서 최댓값을 삭제
                    priorityQueue.sort()
                    priorityQueue.removeLast()
                    continue
                } else {
                    // D -1: 큐에서 최솟값을 삭
                    priorityQueue.sort()
                    priorityQueue.removeFirst()
                    continue
                }
            }
        }
    }
    
    // 2. 모든 연산을 처리한 후 return
    if priorityQueue.isEmpty {
        return [0, 0]
    } else {
        guard let max = priorityQueue.max() else { return [] }
        guard let min = priorityQueue.min() else { return [] }
        return [max, min]
    }
}

//print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"])) // [0,0]
//print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])) // [333, -45]
//print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333", "D -1", "D -1"])) // [333, 333]
