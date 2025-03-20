//
//  CarError.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/20/25.
//

enum CarError: Error {
    case engineNotFound
    
    var errorDiscription: String {
        switch self {
        case .engineNotFound:
           return "Engine Not Found"
        }
    }
}
