//
//  UserListTest.swift
//  ListUserAppTests
//
//  Created by Javier Lumbi on 14/10/24.
//

import XCTest
@testable import ListUserApp

final class UserListProviderTest: XCTestCase {

    var apiService: APIServiceProtocol?
    
    override func setUp() {
        apiService = APIServiceMock()
    }

    override func tearDown() {
        apiService = nil
    }
}

// MARK: - Success Tests
extension UserListProviderTest {
    func testSuccessCase_getUsers() async {
        do {
            let endPoint: UserListEndPoint = .getUsers
            let users: [UserListElement] = try await apiService!.sendRequest(endpoint: endPoint)
            XCTAssertTrue(users.first?.id == 1)
        } catch {
            XCTFail("Always receive a response and not throw an error")
        }
    }
}
