//
//  DIContainer.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

// Dependency Injection Container
// Manages the creation and lifecycle of all dependencies
class DIContainer {
    
    // MARK: - Singleton
    static let shared = DIContainer()
    
    // MARK: - Network Layer
    private lazy var httpClient: HTTPClient = {
        return HTTPClient(baseURL: "https://fake-json-api.mock.beeceptor.com")
    }()
    
    // MARK: - Data Layer - Remote Data Sources
    private lazy var userListRemoteDataSource: UserListRemoteDataSource = {
        return UserListRemoteDataSource(apiClient: httpClient)
    }()
    
    private lazy var userDetailRemoteDataSource: UserDetailRemoteDataSource = {
        return UserDetailRemoteDataSource(apiClient: httpClient)
    }()
    
    
    // MARK: - Data Layer - Repositories
    private lazy var userDetailRepository: UserDetailRepository = {
        return UserDetailRepository(
            remoteDataSource: userDetailRemoteDataSource,
        )
    }()
    
    private lazy var userListRepository: UserListRepository = {
        return UserListRepository(
            remoteDataSource: userListRemoteDataSource,
        )
    }()
    
    // MARK: - Domain Layer - ViewModels
    @MainActor func makeUserListViewModel() -> UserListViewModel {
        return UserListViewModel(repository: userListRepository, diContainer: self)
    }
    
    @MainActor func makeUserDetailViewModel(userId: Int) -> UserDetailViewModel {
        return UserDetailViewModel(repository: userDetailRepository, userId: userId)
    }
}
