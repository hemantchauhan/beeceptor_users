//
//  UserListRemoteDataSource.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

protocol UserListRemoteDataSourceProtocol {
    func fetchUserList() async throws -> [User]
}

class UserListRemoteDataSource: UserListRemoteDataSourceProtocol {
    private let apiClient: HTTPClient
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
    }
    
    func fetchUserList() async throws -> [User] {
        let data = try await apiClient.request(url: "/users", method: .GET)
        
        let users = try JSONDecoder().decode([UserData].self, from: data)
        
        let mappedData = users.map { user in
            UserDataMapper.map(user)
        }
        
        return mappedData
    }
    
}
