//
//  Player.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

/// GameHistory: Singleton 패턴으로, Game History 관리
class Player {
    static let shared = Player()
    
    private lazy var gameRound: Int = 0
    private lazy var playCount: Int = 0
    private var history: [Int] = []
    
    private init() { }
    
    func play() {
        self.playCount += 1
    }
    
    func getPlayedNumber() -> Int {
        return self.playCount
    }
    
    func getHistory() -> [Int] {
        return self.history
    }
    
    func updateHistory(playCount: Int) {
        self.history.append(playCount)
        clearPlayCount()
    }
    
    func clearPlayCount() {
        self.playCount = 0
    }
}
