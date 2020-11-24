//
//  APIEndPoints.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

// MARK API Endpoints
struct APIEndPoints {
    static func mostviewed(period: Period) -> String {
        return "/svc/mostpopular/v2/viewed/\(period.rawValue)"
    }
}
