//
//  NewsFeedModel.swift
//  Assignment
//
//  Created by Shivangi on 12/02/22.
//

import Foundation

struct NewsFeedModel: Codable {
    
    var status: String?
    var items: [NewsFeedItem]?
}

struct NewsFeedItem: Codable {
    
    var title: String?
    var pubDate: String?
    var link: String?
    var guid: String?
    var thumbnail: String?
    var author: String?
    var description: String?
    var content: String?
    var enclosure: Enclosure?
}

struct Enclosure: Codable {
    var link: String?
    var type: String?
    var thumbnail: String?
}
