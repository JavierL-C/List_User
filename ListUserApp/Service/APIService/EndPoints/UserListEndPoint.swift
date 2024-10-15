//
//  UserListEndPoint.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation
import SwiftUI

enum UserListEndPoint: EndpointProvider {
    
    case getUsers
    
    var path: String {
        switch self {
        case .getUsers: return "/users"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getUsers: return .get
        }
    }
    
    var mockData: Data? {
        switch self {
        case .getUsers: return UserListMock.makeUserListJsonFake()
        }
    }
}
