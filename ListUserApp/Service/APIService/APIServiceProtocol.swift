//
//  APIServiceProtocol.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation

protocol APIServiceProtocol {
    var scheme: String { get set }
    var baseURL: String { get set }
    func sendRequest<T: Decodable>(endpoint: EndpointProvider) async throws -> T
}

extension APIServiceProtocol {
    func createRequest(endPoint: EndpointProvider) -> URLRequest? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.baseURL
        urlComponents.path = "/\(endPoint.path)"

        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue

        return request
    }
}
