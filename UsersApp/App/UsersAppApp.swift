//
//  UsersAppApp.swift
//  UsersApp
//
//  Created by ICHI14 on 04/11/25.
//

import SwiftUI

@main
struct UsersAppApp: App {
    private let container = DIContainer()
    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: container.makeUserListViewModel())
        }
    }

}
