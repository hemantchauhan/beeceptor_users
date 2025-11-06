//
//  UserDetailViewModel.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

@MainActor
class UserDetailViewModel: ObservableObject {
    public enum State: Equatable {
        case idle
        case loading
        case loaded(UserDetail)
        case failed(String)
    }
    
    private let repository: UserDetailRepositoryProtocol
    let userId: Int
    
    //@Published var users: [User] = []
    @Published var state: State = .idle
    
    init(repository: UserDetailRepositoryProtocol, userId: Int ) {
        self.repository = repository
        self.userId = userId
    }
    
    func loadUserDetail() async {
        state = .loading
        
        Task {
            do {
                let user = try await repository.fetchUserDetail(userId: userId)
                state = .loaded(user)
            }
            catch {
                state = .failed(error.localizedDescription)
            }
        }
    }
}
