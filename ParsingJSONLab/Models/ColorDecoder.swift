//
//  ColorDecoder.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
enum JSONError: Error {
    case decodingError(Error)
}

struct Colour: Codable {
    let rbg: RBG
    
    static func getColors(from data:Data) throws -> [Colour] {
        do {
            let colors = try JSONDecoder().decode([Colour].self, from: data)
            return colors
        } catch {
           throw JSONError.decodingError(error)
        }
        
    }
}

struct RBG: Codable {
    let fraction: Fraction
}
struct Fraction: Codable {
    let r: Double
    let g: Double
    let b: Double
}
