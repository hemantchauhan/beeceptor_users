//
//  UserListViewModel.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    public enum State: Equatable {
        case idle
        case loading
        case loaded([User])
        case failed(String)
    }
    
    private let repository: UserListRepositoryProtocol
    private let diContainer: DIContainer
        
    func makeDetailViewModel(for user: User) -> UserDetailViewModel {
        diContainer.makeUserDetailViewModel(userId: user.id)
    }
    
    //@Published var users: [User] = []
    @Published var state: State = .idle
    
    init(repository: UserListRepositoryProtocol, diContainer: DIContainer) {
        self.repository = repository
        self.diContainer = diContainer
    }
    
    func loadUsers() async {
        state = .loading
        
        Task {
            do {
                let users = try await repository.fetchUsers()
                state = .loaded(users)
            }
            catch {
                state = .failed(error.localizedDescription)
            }
        }
    }
}
