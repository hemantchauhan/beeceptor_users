//
//  UserMapper.swift
//  UsersApp
//
//  Created by ICHI14 on 06/11/25.
//

import Foundation

struct UserDataMapper {
    static func map(_ data: UserData) -> User {
        User(id: data.id, name: data.name, username: data.username, email: data.email, photo: data.phone)
    }
    
    static func mapToDetail(_ data: UserData) -> UserDetail {
        UserDetail(id: data.id, company: data.company, address: data.address, zip: data.zip, state: data.state, country: data.country, phone: data.phone)
    }
}
