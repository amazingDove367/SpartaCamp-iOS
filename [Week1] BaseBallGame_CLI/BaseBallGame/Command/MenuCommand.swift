//
//  MenuCommand.swift
//  BaseBallGame
//
//  Created by kingj on 3/14/25.
//

import Foundation

///  Command Pattern을 적용
/// - Invoker : Game
/// - Receiver: MenuControl

// MARK: Receiver
final class MenuControl {
    private let startCommand: Commanding
    private let showHistoryCommand: Commanding
    private let exitCommand: Commanding
    private let rulesCommand: Commanding
    private var commandHistory: [Commanding] = []
    
    init(
        start: Commanding,
        showHistory: Commanding,
        exit: Commanding,
        rules: Commanding
    ) {
        self.startCommand = start
        self.showHistoryCommand = showHistory
        self.exitCommand = exit
        self.rulesCommand = rules
    }
    
    func start() {
        self.startCommand.execute()
        self.commandHistory.append(self.startCommand)
    }
    
    func showHistory() {
        self.showHistoryCommand.execute()
        self.commandHistory.append(self.showHistoryCommand)
    }
    
    func exit() {
        self.exitCommand.execute()
        self.commandHistory.append(self.exitCommand)
    }
    
    func rules() {
        self.rulesCommand.execute()
        self.commandHistory.append(self.rulesCommand)
    }
    
    func undo() {
        if !self.commandHistory.isEmpty {
            let command = self.commandHistory.removeLast()
            command.undo()
        }
    }
}

// MARK: Command
protocol Commanding {
    func execute()
    func undo()
}

// MARK: Command 구체화 - StartCommand
final class StartCommand: Commanding {
    let receiver: GameInvoker
    
    init(receiver: GameInvoker) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.start()
    }
    
    func undo() {
        receiver.undo()
    }
}

// MARK: Command 구체화 - ShowHistoryCommand
final class ShowHistoryCommand: Commanding {
    let receiver: GameInvoker
    
    init(receiver: GameInvoker) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.showHistory()
    }
    
    func undo() {
        receiver.undo()
    }
}

// MARK: Command 구체화 - ExitCommand
final class ExitCommand: Commanding {
    let receiver: GameInvoker
    
    init(receiver: GameInvoker) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.exit()
    }
    
    func undo() {
        receiver.undo()
    }
}

// MARK: Command 구체화 - RulesCommand
final class RulesCommand: Commanding {
    let receiver: GameInvoker
    
    init(receiver: GameInvoker) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.rules()
    }
    
    func undo() {
        receiver.undo()
    }
}
