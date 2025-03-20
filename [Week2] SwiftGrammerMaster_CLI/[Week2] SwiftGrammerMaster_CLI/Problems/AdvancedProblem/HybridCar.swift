//
//  HybridCar.swift
//  [Week2] SwiftGrammerMaster_CLI
//
//  Created by kingj on 3/20/25.
//

import Foundation

class HybridCar: Car {
    
    override init(brand: String, model: String, year: String) {
        super.init(brand: brand, model: model, year: year)
        self.engine = .hydrogenEngine
    }
    
    override func drive() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 주행 중...")
    }
    
    override func stop() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 정지")
    }
    
    /// refuel
    /// HybridCar 주유 메소드
    func refuel() {
        print("\(model) [\(brand)-\(year)-\(getEngineType())] 주유 중...")
    }
    
    /// switchEngine
    /// - Run-time 에 엔진을 변경할 수 있는 메소드
    func switchEngine(to engine: Engine) {
        print("기존 [\(getEngineType())] 엔진에서 [\(engine.rawValue)] 엔진으로 변경되었습니다.")
        self.engine = engine
    }
}

