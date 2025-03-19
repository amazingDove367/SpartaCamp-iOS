//
//  IOHelper.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/19/25.
//

import Foundation

/// readInput 
/// - 사용자에게 입력을 요구
/// - 입력 받은 String 값을 Optional Unwrapping 하여 반환
func readInput(prompt: String) -> String {
    print(prompt, terminator: " ")
    return readLine() ?? ""
}
