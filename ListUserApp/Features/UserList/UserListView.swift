//
//  UserListView.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import SwiftUI

struct UserListView: View {
    @Bindable var viewModel: UserListViewModel
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        
        if viewModel.isLoading {
            ProgressView("Loading users...")
        } else if let errorMessage = viewModel.errorMessage {
            Text("Error: \(errorMessage)")
        } else {
            NavigationSplitView(columnVisibility: $columnVisibility) {
                List(viewModel.users, id: \.id, selection: $viewModel.selectedUser) { user in
                    NavigationLink(value: user) {
                        UserRow(user: user)
                    }
                }
                .navigationTitle("Users")
            } detail: {
                if let user = viewModel.selectedUser {
                    UserListDetailView(viewModel: UserListDetailVideModel(user: user))
                    .id(user.id)
                } else {
                    Text("Tap a user to see the details")
                        .foregroundColor(.secondary)
                }
            }
            .navigationSplitViewStyle(.balanced)
        }
    }
}

#Preview {
    let vm = UserListViewModel(apiService: APIServiceMock())
    UserListView(viewModel: vm)
}
