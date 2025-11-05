//
//  HTTPClient.swift
//  UsersApp
//
//  Created by ICHI14 on 05/11/25.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

protocol HTTPClientProtocol {
    func request(url: String, method: HTTPMethod) async throws -> Data
}

class HTTPClient: HTTPClientProtocol {
    
    private let baseURL: String
    private let urlSession: URLSession
    
    init(baseURL: String, urlSession: URLSession = .shared) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }
    
    func request(url: String, method: HTTPMethod) async throws -> Data {
        
        guard let fullURL = URL(string: baseURL + url) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
            
        return data
    }
}
