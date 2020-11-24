//
//  NewsService.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import UIKit

extension APIManager {

    /// Get News based on selected period
    /// - Parameters:
    ///   - period: Period Enum
    ///   - completion: (_ error:String?, _ data:[ResultModel]?)
    func getNews(period:Period, completion: @escaping (_ error:String?, _ data:[NewsObjectModel]?) -> Void) {
        let endPoint = APIEndPoints.mostviewed(period: period)
        self.makeHttpRequest(endPoint: endPoint, httpMethod: .get, parameters: nil, headers: nil) { (resp) in
            if resp.status! == .success {
                if let data = resp.data {
                    Utils.parseCodable(data: data, type: NewsResult.self) { (decoded) in
                        completion(nil, decoded.results)
                    } errorHandler: { (error) in
                        completion(error, nil)
                    }
                } else {
                    completion(resp.generalErrorMessage, nil)
                }
            } else {
                completion(resp.message, nil)
            }
        }
    }
}

