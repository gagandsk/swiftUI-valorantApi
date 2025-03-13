//
//  Agent.swift
//  valorantApiTest
//
//  Created by Gagandeep Dass Kaur on 13/3/25.
//

import Foundation

struct Agent: Identifiable, Codable {
    let id: String
    let displayName: String
    let description: String
    let role: Role?
    let displayIcon: String
    let isPlayableCharacter: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case displayName
        case description
        case role
        case displayIcon
        case isPlayableCharacter
    }
}

struct Role: Codable {
    let displayName: String
    let description: String
    let displayIcon: String
}
