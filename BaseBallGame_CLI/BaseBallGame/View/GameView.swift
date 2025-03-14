//
//  GameView.swift
//  BaseBallGame
//
//  Created by kingj on 3/13/25.
//

import Foundation

class GameView {
    
    private var gameVM = GameViewModel()
    
    /// 메뉴 선택
    func selectMenu() {
        Menu.openingUI()
        
        while true {
            Menu.menuUI()
            
            if let input = Int(readLine()!), let menu = Menu(rawValue: input) {
                switch menu {
                case .startGame:
                    self.gameVM.start()
                case .showHistory:
                    self.gameVM.showHistory()
                case .exit:
                    self.gameVM.exit()
                    return
                }
            } else {
                InputHandler.wrongInputUI()
            }
        }
    }
}
