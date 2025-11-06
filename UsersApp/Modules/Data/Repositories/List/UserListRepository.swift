//
//  UserListRepository.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

protocol UserListRepositoryProtocol {
    func fetchUsers() async throws -> [User]
}

class UserListRepository: UserListRepositoryProtocol {
    private let remoteDataSource: UserListRemoteDataSource
    //private let localDataSource: UserListLocalDataSource
    
    init(remoteDataSource: UserListRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    
    func fetchUsers() async throws -> [User] {
        // TODO: first check local data source
        
        let users = try await remoteDataSource.fetchUserList()
        // TODO: save to local data source
        return users
    }
    
    
}
