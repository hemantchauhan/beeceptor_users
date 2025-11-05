//
//  User.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation
// Domain layer entities - may differ from Data entities - business logic models

// MARK: - User
struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name, username, email: String
    let photo: String
}

// MARK: - UserDetail
struct UserDetail: Identifiable, Codable, Equatable {
    let id: Int
    let company, address, zip, state, country: String
    let phone: String
}
