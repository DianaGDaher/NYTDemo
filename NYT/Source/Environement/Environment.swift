//
//  Environment.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import Foundation

struct Environment {
    static let BASE_URL = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    static let API_KEY = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
}
