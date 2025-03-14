//
//  MenuView.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

enum Menu: Int {
    case startGame = 1
    case showHistory = 2
    case exit = 3
    
    static func openingUI() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
    }
    
    static func menuUI() {
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    }
    
    static func startGameUI() {
        print("\n< 게임을 시작합니다 >")
    }
    
    static func showHistoryUI() {
        print("\n< 게임 기록 보기 >")
    }
    
    static func historyUI(round: Int?, playCount: Int?) {
        if let round = round, let playCount = playCount {
            print("\(round + 1)번째 게임 : 시도 횟수 - \(playCount)\n")
        } else {
            print("아직 게임 기록이 없습니다!\n")
        }
    }
    
    static func exitUI() {
        print("\n< 게임을 종료 합니다 >")
    }
}
