//
//  UserListView.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation
import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel: UserListViewModel
    
    init(viewModel: UserListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            content.navigationTitle("Users")
        }
        .task {
            if case viewModel.state = .idle {
                await viewModel.loadUsers()
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading").frame(maxWidth: .infinity, maxHeight: .infinity)
        case .failed(let message):
            VStack(spacing: 12) {
                Text("Failed to load users")
                Text(message).font(.footnote)
                Button("Retry") {
                    Task {
                        await viewModel.loadUsers()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        case .loaded(let users):
            if users.isEmpty {
                ContentUnavailableView("No users", image: "")
            } else {
                List(users, id: \.id) { user in
                    NavigationLink {
                        UserDetailView(viewModel: viewModel.makeDetailViewModel(for: user))
                    } label: {
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: user.photo)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle.fill")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email).font(.subheadline).foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    UserListView(viewModel: DIContainer().makeUserListViewModel())
}
