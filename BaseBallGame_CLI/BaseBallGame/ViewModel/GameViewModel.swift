//
//  GameViewModel.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

class GameViewModel {
    
    private var player = Player.shared
    private var hintVM = HintViewModel()
    
    // MARK: 1. 게임 시작
    func start() {
        Menu.startGameUI()
        
        /// 랜덤 답 생성
        let answer = RandomAnswerGenerator.makeAnswer()
        
        while true {
            InputHandler.requestInputAnswerUI()
            
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
    
    // MARK: 4. 게임 규칙
    func rules() {
        Rules.show()
    }
    
    // MARK: 정답 / 힌트 출력 로직
    func isAnswer(input: String, answer: String) -> Bool {
        return hintVM.hintGenerator(input: input, answer: answer)
    }
}
