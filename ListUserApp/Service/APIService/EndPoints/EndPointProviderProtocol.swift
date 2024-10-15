//
//  EndPointProviderProtocol.swift
//  ListUserApp
//
//  Created by Javier Lumbi on 14/10/24.
//

import Foundation

protocol EndpointProvider {

    var path: String { get }
    var method: RequestMethod { get }
    var mockData: Data? { get }
    
// MARK: for this project this properties are no need it
//    var token: String? { get }
//    var queryItems: [URLQueryItem]? { get }
//    var body: [String: Any]? { get }
}
