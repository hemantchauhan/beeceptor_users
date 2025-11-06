//
//  UserDetailRemoteDataSource.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

enum error: Error {
    case detailNotFound
    var errorDescription: String? {
            switch self {
            case .detailNotFound:
                return "The user's detail was not found."
            }
        }
}

protocol UserDetailRemoteDataSourceProtocol {
    func fetchUserDetail(userId: Int) async throws -> UserDetail
}

class UserDetailRemoteDataSource: UserDetailRemoteDataSourceProtocol {
    private let apiClient: HTTPClient
    
    init(apiClient: HTTPClient) {
        self.apiClient = apiClient
    }
    
    func fetchUserDetail(userId: Int) async throws -> UserDetail {
        let data = try await apiClient.request(url: "/users", method: .GET)
        let response = try JSONDecoder().decode([UserData].self, from: data)
        let userData = response.first { user in
            user.id == userId
        }
        
        if let user = userData {
            return UserDataMapper.mapToDetail(user)
        }
        else {
            throw error.detailNotFound
        }
    }
    
    
}
