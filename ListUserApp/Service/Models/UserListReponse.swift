//
//  UserListReponse.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation

// MARK: - UserListElement
struct UserListElement: Codable, Hashable {
    
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserListElement, rhs: UserListElement) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias UserList = [UserListElement]
