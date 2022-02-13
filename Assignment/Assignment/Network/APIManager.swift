//
//  APIManager.swift
//  Assignment
//
//  Created by Shivangi on 12/02/22.
//

import Foundation

class APIService {
    
    // Main API Call
    func fetchRssFeed(completion: @escaping ([NewsFeedItem]?)-> Void) {
        
        // URL for ABC News RSS Feed
        guard let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml") else {
            completion(nil)
            return
        }
        
        // URL Session request
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                
                // To print the response
                let responseStr = String(decoding: data, as: UTF8.self)
                print(responseStr)
                
                // Decode Json response to Model provided
                let newsFeedResp = try? JSONDecoder().decode(NewsFeedModel.self, from: data)
                
                // If any data, send back completion
                if let newsFeed = newsFeedResp?.items {
                    completion(newsFeed)
                } else {
                    completion(nil)
                }
                return
            }
            completion(nil)
        }.resume()
    }
}
