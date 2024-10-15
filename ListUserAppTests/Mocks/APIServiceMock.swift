//
//  APIServiceMock.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation
@testable import ListUserApp

class APIServiceMock: APIServiceProtocol {
    var scheme: String
    
    var baseURL: String
    
    init() {
        scheme = ""
        baseURL = ""
    }
    
    func sendRequest<T>(endpoint: any ListUserApp.EndpointProvider) async throws -> T where T : Decodable {
        do {
            let data = endpoint.mockData
            let decodedResponse = try JSONDecoder().decode(T.self, from: data!)
            return decodedResponse
        } catch {
            throw NetworkError.parseError
        }
    }
}
