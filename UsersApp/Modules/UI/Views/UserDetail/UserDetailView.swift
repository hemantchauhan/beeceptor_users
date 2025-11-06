//
//  UserDetailView.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    
    @StateObject private var viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        contentScreen
            .task {
                if case viewModel.state = .idle {
                    await viewModel.loadUserDetail()
                }
            }
    }
    
    @ViewBuilder
    private var contentScreen: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading").frame(maxWidth: .infinity, maxHeight: .infinity)
        case .failed(let message):
            VStack(spacing: 12) {
                Text("Failed to load users")
                Text(message).font(.footnote)
                Button("Retry") {
                    Task {
                        await viewModel.loadUserDetail()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        case .loaded(let user):
            Form {
                Section(header: Text("User Details")) {
                    Text("Company: \(user.company)")
                    Text("Address: \(user.address)")
                    Text("Phone: \(user.phone)")
                    Text("Country: \(user.country)")
                }
            }
        }
    }
}
