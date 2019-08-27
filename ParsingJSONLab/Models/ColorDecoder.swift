//
//  ColorDecoder.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: Error {
    case decodingError(Error)
}

struct Colour: Codable {
    let name: Name
    let hex: Hex
    let rgb: RGB
    
    static func getColors(from data:Data) throws -> [Colour] {
        do {
            let colors = try JSONDecoder().decode([Colour].self, from: data)
            return colors
        } catch {
           throw JSONError.decodingError(error)
        }
    }
    func getUIColor() -> UIColor {
        return UIColor(red: CGFloat(self.rgb.fraction.r), green: CGFloat(self.rgb.fraction.g), blue: CGFloat(self.rgb.fraction.b), alpha: 1)
    }
}

struct Name: Codable {
    var value: String
}

struct Hex: Codable {
    let value: String
}

struct RGB: Codable {
    let fraction: Fraction
}
struct Fraction: Codable {
    let r: Double
    let g: Double
    let b: Double
}
