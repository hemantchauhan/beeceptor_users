//
//  UserEntity.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

// Raw data model from API
 
// MARK: - UserData
struct UserData: Identifiable, Codable, Equatable {
    let id: Int
    let name, company, username, email: String
    let address, zip, state, country: String
    let phone: String
    let photo: String
}
