//
//  main.swift
//  SwiftAlgorithmCodeKata
//
//  Created by kingj on 3/12/25.
//

import Foundation

//print("Hello, World!")

start()

func start() {
    
    var numbers: [Int] = []
    var stack = Stack<(Int, Int)>() // (idx: Int, value: Int)
    
    // input String value -> Int Array
    let input = readLine()
    if let input = input {
        numbers = input.filter { $0.isNumber || $0 == "," }
            .split(separator: ",")
            .compactMap { Int($0) }
    }
    
    // index 기준 adj 생성
    var adj: [[Int]] = Array(repeating: [], count: numbers.count)
    
    for (idx, value) in numbers.enumerated() {
        adj[idx].append(value)
        adj[idx].append(value * (-1))
    }
    
    // pointer
    var start = 0 , end = adj.count - 1
    var pointer = start
    
    stack.push((0, adj[0][0]))
    stack.push((0, adj[0][1])) // [(0, 4), (0, -4)]
    
    while stack.size() > 0 {
        // DFS
        
        for (idx, value) in stack.getElemets().enumerated() {
            stack.push((idx, adj[idx]))
        }
        
        let tupple = stack.pop()! // (0, -4)
        if tupple.0 == end {
            // pop
        } else {
            // stack 에 push
            stack.push(<#T##element: (Int, Int)##(Int, Int)#>)
        }
    }
}

func dfs(stack: Stack<(Int, Int)>, adj: [[Int]]) {
    
}

struct Stack<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    mutating func lastElement() -> T? {
        return elements.isEmpty ? nil : elements[elements.count - 1]
    }
    
    mutating func size() -> Int {
        return elements.count
    }
    
    mutating func getElemets() -> [T] {
        return elements
    }
}
