//
//  GameInvoker.swift
//  BaseBallGame
//
//  Created by kingj on 3/14/25.
//

import Foundation

///  Command Pattern을 적용
/// - Invoker : Game
/// - Receiver: MenuControl
///
// MARK: Invoker
final class GameInvoker {
    
    private var player = Player.shared
    private var menu: Menu?
    private unowned var gameVM: GameViewModel
    
    init(gameVM: GameViewModel) {
        self.gameVM = gameVM
    }
    
    /// 1. 게임 시작
    func start() {
        print("\n< 게임을 시작합니다 >")
        
        /// 랜덤 답 생성
        let answer = RandomAnswerGenerator.makeAnswer()
        
        while true {
            print("숫자를 입력하세요")
            
            /// Input Validity 체크
            let input = readLine()
            if InputHandler.isValidInput(input: input) {
                
                /// Player 게임 시도 횟수 1 증가
                player.play()
                
                /// 정답 판별 - 정답일 경우, 게임 기록 업데이트
                if gameVM.isAnswer(input: input!, answer: String(answer)) {
                    player.updateHistory(playCount: player.getPlayedNumber())
                    break
                }
            } else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
        }
    }
    
    /// 2. 게임 기록 보기
    func showHistory() {
        print("\n< 게임 기록 보기 >")
        
        let history = player.getHistory()
        if !history.isEmpty {
            for (round, playCount) in history.enumerated() {
                print("\(round + 1)번째 게임 : 시도 횟수 - \(playCount)")
            }
        } else {
            print("아직 게임 기록이 없습니다!")
        }
    }
    
    /// 3. 게임 종료
    func exit() {
        print("< 게임을 종료 합니다 >")
    }
    
    /// 이전(상위) Menu로 이동
    func undo() {
        // 기능이 추가될 경우, 기능별로 업데이트
    }
}
