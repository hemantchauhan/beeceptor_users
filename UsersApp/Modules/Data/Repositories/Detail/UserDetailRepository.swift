//
//  UserDetailRepository.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

protocol UserDetailRepositoryProtocol {
    func fetchUserDetail(userId: Int) async throws -> UserDetail
}

class UserDetailRepository: UserDetailRepositoryProtocol {
    
    private let remoteDataSource: UserDetailRemoteDataSource
    
    init(remoteDataSource: UserDetailRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUserDetail(userId: Int) async throws -> UserDetail {
        // TODO: first check local data source
        
        let users = try await remoteDataSource.fetchUserDetail(userId: userId)
        // TODO: save to local data source
        return users
    }
    
}
