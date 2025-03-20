//
//  ElectricCar.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/20/25.
//

import Foundation

class ElectricCar: Car {
    
    override init(brand: String, model: String, year: String) {
        super.init(brand: brand, model: model, year: year)
        self.engine = .electricEngine
    }
    
    override func drive() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 주행 중...")
    }
    
    override func stop() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 정지")
    }
    
    /// charge
    /// ElectricCar 주유 메소드
    func charge() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 전기 충전 중...")
    }
}
