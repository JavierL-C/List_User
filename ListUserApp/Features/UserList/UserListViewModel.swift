//
//  UserListViewModel.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import SwiftUI

@Observable
final class UserListViewModel {
    
    let apiService: APIServiceProtocol
    var users: [UserListElement] = []
    var selectedUser: UserListElement?
    var isLoading: Bool = false
    var errorMessage: String?
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        isLoading = true
        let endpoint: UserListEndPoint = .getUsers
        do {
            self.users = try await apiService.sendRequest(endpoint: endpoint)
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
