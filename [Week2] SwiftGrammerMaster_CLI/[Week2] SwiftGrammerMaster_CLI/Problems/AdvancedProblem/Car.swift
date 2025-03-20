//
//  Car.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/20/25.
//

import Foundation

class Car {
    
    var brand: String
    var model: String
    var year: String
    var engine: Engine?
    
    init(brand: String, model: String, year: String) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    func drive() {
        print("Car[\(brand)-\(model)-\(year)] 주행 중...")
    }
    
    func stop() {
        print("Car[\(brand)-\(model)-\(year)] 정지")
    }
    
    func getEngineType() -> String {
        guard let engine = self.engine?.rawValue else { return "Default Engine" }
        return engine
    }
    
    /// checkEngine
    /// - Optional Engine 타입인 engine 값을 확인하는 메소드
    /// - 예외처리 연습용
    func checkEngine() throws -> String {
        guard let engine = self.engine else {
            throw CarError.engineNotFound
        }
        return engine.rawValue
    }
}
