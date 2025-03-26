//
//  250326_Graph.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/26/25.
//

import Foundation

// TODO
// 노드 : 1부터 n까지
// Q.  1번 노드에서 가장 멀리 떨어진 `노드의 갯수` (최단경로)
//  - 최단경로로 이동했을 때 간선의 개수가 가장 많은 `노드`
// Input:
// - n: 노드의 개수
// - vertex : 간선에 대한 정보가 담긴 2차원 배열

// 풀이 기술
// 1. 인접 배열 adj
// 2. visit 배열 - check 배열
// 3. 최단경로 배열 - 연산 배열
// 4. BFS (queue)

// Queue 구현
func solution_0326(_ n:Int, _ edge:[[Int]]) -> Int {
    
    // 1. 인접배얼 adj
    var adj = [[Int]](repeating: [], count: n)
    edge.forEach {
        adj[$0[0] - 1].append($0[1] - 1)
        adj[$0[1] - 1].append($0[0] - 1)
    }
    
    // 2. visit 배열 - check 배열
    var visit = [Bool](repeating: false, count: n)
    
    // 3. 최단경로 배열 - 연산 배열
    var distance = [Int](repeating: 0, count: n)
    
    var queue = Queue<Int>()
    queue.push(0)
    visit[0] = true
    
    // 4. BFS
    while !queue.isEmpty {
        let idx = queue.pop()!
        
        for value in adj[idx] {
            if visit[value] == false {
                queue.push(value)
                visit[value] = true
                distance[value] = distance[idx] + 1
            }
        }
    }
    
    let max = distance.sorted().last!
    let node = distance.filter { $0 == max }.count
    return node
}

//print(solution_0326(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))


struct Queue<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty ? true : false
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func getElements() -> [T]? {
        return elements.isEmpty ? nil : elements
    }
}

