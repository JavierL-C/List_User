//
//  APIService.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case invalidURL
    case unexpectedStatusCode
    case parseError
    case unknown
}

class APIService: APIServiceProtocol {
    var scheme: String
    var baseURL: String
    
    init(scheme: String = "https", baseURL: String = "jsonplaceholder.typicode.com") {
        self.scheme = scheme
        self.baseURL = baseURL
    }
    
    func sendRequest<T: Decodable>(endpoint: EndpointProvider) async throws -> T {
        guard let urlRequest = createRequest(endPoint: endpoint) else { throw NetworkError.badRequest }
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
                .dataTask(with: urlRequest) { data, response, _ in
                    guard response is HTTPURLResponse else {
                        continuation.resume(throwing: NetworkError.invalidURL)
                        return
                    }
                    guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                        continuation.resume(throwing:
                                                NetworkError.unexpectedStatusCode)
                        return
                    }
                    
                    guard let data = data else {
                        continuation.resume(throwing: NetworkError.unknown)
                        return
                    }
                    
                    guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                        continuation.resume(throwing: NetworkError.parseError)
                        return
                    }
                    
                    continuation.resume(returning: decodedResponse)
                }
            task.resume()
        }
    }
}
