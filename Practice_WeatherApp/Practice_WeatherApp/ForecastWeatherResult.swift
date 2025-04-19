//
//  ForecastWeatherResult.swift
//  Practice_WeatherApp
//
//  Created by kingj on 4/18/25.
//

import Foundation

struct ForecastWeatherResult: Codable {
    let list: [ForcastWeather]
}

struct ForcastWeather: Codable {
    let main: WeatherMain
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case dtTxt = "dt_txt"
    }
}
