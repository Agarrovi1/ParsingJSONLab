//
//  WeatherDecoder.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Weather: Codable {
    var name: String
    var main: Main
    var weather: [WeatherInfo]
    
    static func getWeathers(from data:Data) throws -> [Weather] {
        do {
            let weathers = try JSONDecoder().decode([Weather].self, from: data)
            return weathers
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct Main: Codable {
    var temp: Double
}

struct WeatherInfo: Codable {
    var main: String
    var description: String
}
