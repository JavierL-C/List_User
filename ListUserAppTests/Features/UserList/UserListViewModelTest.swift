//
//  UserListViewModelTest.swift
//  ListUserAppTests
//
//  Created by Javier Lumbi on 14/10/24.
//

import XCTest
@testable import ListUserApp

final class UserListViewModelTest: XCTestCase {

    var apiService: APIServiceProtocol?
    var viewModel: UserListViewModel?
    
    override func setUp() {
        apiService = APIServiceMock()
        viewModel = UserListViewModel(apiService: apiService!)
    }

    override func tearDown() {
        apiService = nil
        viewModel = nil
    }
}

extension UserListViewModelTest {
    func testSuccessCase_LoadUsers() async {
        await viewModel?.loadUsers()
        XCTAssertFalse(viewModel!.users.isEmpty)
        XCTAssertEqual(viewModel!.users.first?.id, 1)
    }
}
