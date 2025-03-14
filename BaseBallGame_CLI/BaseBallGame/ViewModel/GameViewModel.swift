//
//  GameViewModel.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

class GameViewModel {
    
    private var player = Player.shared
    
    // MARK: 1. 게임 시작
    func start() {
        Menu.startGameUI()
        
        /// 랜덤 답 생성
        let answer = RandomAnswerGenerator.makeAnswer()
        
        while true {
            InputHandler.requestInputUI()
            
            /// Input Validity 체크
            let input = readLine()
            if InputHandler.isValidInput(input: input) {
                
                /// Player 게임 시도 횟수 1 증가
                player.play()
                
                /// 정답 판별 - 정답일 경우, 게임 기록 업데이트
                if isAnswer(input: input!, answer: String(answer)) {
                    player.updateHistory(playCount: player.getPlayedNumber())
                    break
                }
            } else {
                InputHandler.wrongInputUI()
                continue
            }
        }
    }
    
    // MARK: 2. 게임 기록 보기
    func showHistory() {
        Menu.showHistoryUI()
        
        let history = player.getHistory()
        if !history.isEmpty {
            for (round, playCount) in history.enumerated() {
                Menu.historyUI(round: round, playCount: playCount)
            }
        } else {
            Menu.historyUI(round: nil, playCount: nil)
        }
    }
    
    // MARK: 3. 게임 종료
    func exit() {
        Menu.exitUI()
    }
    
    func isAnswer(input: String, answer: String) -> Bool {
        return hintGenerator(input: input, answer: answer)
    }
    
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
            
            // Srike & Ball Checker
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
            
            // Hint
            if strike == 0 && ball == 0 {
                print("Nothing\n")
                return false
            } else if strike != 0 && ball == 0   {
                print("\(strike)스트라이크\n")
                return false
            } else if strike == 0 {
                print("\(ball)볼\n")
                return false
            } else {
                print("\(strike)스트라이크 \(ball)볼\n")
                return false
            }
        }
    }
    
}
