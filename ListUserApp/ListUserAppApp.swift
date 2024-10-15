//
//  ListUserAppApp.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import SwiftUI

@main
struct ListUserAppApp: App {
    static let viewMdoel = UserListViewModel()
    
    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: ListUserAppApp.viewMdoel)
        }
    }
}
