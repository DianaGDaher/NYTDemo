//
//  NewsModel.swift
//  NYNews
//
//  Created by Diana on 11/24/20.
//

import UIKit

class NewsModel: NSObject {
    
    func getNews(completion: @escaping (_ error: String?,_ data: [NewsObjectModel]?) -> Void) {
        Services.getNews(period: Period.thirty) { (error, data) in
            if let error = error {
                completion(error, nil)
            } else {
                completion(nil, data)
            }
        }
    }
}

// MARK: - Codables

struct NewsResult: Codable {
    let results: [NewsObjectModel]?
}

struct NewsObjectModel: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let type: String?
    let byline: String?
    let description: String?
    let abstract: String?
    let section: String?
    let subsection: String?
    let published_date: String?
    let source: String?
    let media: [NewsMediaModel]?
}

struct NewsMediaModel: Codable {
    let type: String?
    let subType: String?
    let caption: String?
    let copyright: String?
    let approved: Int?
    let mediaMetadata: [MediaMetadataModel]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case subType
        case caption
        case copyright
        case approved
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadataModel: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
