//
//  APIConfig.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import Foundation
struct APIConfig {
    
    // MARK: - API Config Shared Instance
    static let shared = APIConfig.init()
    private init() {}
    
    // MARK: - API Session
    let manager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 60
        return URLSession(configuration: configuration)
    }()
}

// MARK: - API HTTP Request Content Type
enum ContentType:String {
    case json = "application/json"
    case formURLEncoded = "application/x-www-form-urlencoded"
}

// MARK: - API HTTP Request Methods
enum _HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
