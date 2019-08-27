//
//  UserDecoder.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: UserName
    let email: String
    let location: Location
    let dob: DOB
    let phone: String
    static func getUsers(from data: Data) throws -> [User] {
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        } catch {
            throw JSONError.decodingError(error)
        }
    }
    
    func getFullName() -> String {
        return "\(self.name.title) \(self.name.first) \(self.name.last)"
    }
    func getFullAddress() -> String {
        return "\(location.street)\n\(location.city), \(location.state)"
    }
}

struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
}
struct DOB: Codable {
    let date: String
}
